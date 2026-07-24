#include "systemsettings.h"
#include <QProcess>
#include <QDebug>
#include <QFile>
#include <QTextStream>
#include <QDir>

MythSystemSettings::MythSystemSettings(QObject *parent)
    : QObject(parent)
{
    refreshState();
}

void MythSystemSettings::refreshState()
{
    queryVolume();
    queryBrightness();
    queryWifi();
}

void MythSystemSettings::queryVolume()
{
    // Try wpctl (PipeWire)
    QProcess proc;
    proc.start("wpctl", QStringList() << "get-volume" << "@DEFAULT_AUDIO_SINK@");
    if (proc.waitForFinished(500) && proc.exitCode() == 0) {
        QString out = proc.readAllStandardOutput().trimmed(); // e.g. "Volume: 0.65 [MUTED]"
        if (out.contains("[MUTED]")) {
            m_isMuted = true;
            emit muteChanged();
        } else {
            m_isMuted = false;
            emit muteChanged();
        }
        QStringList parts = out.split(' ', Qt::SkipEmptyParts);
        if (parts.size() >= 2) {
            double val = parts[1].toDouble();
            int vol = static_cast<int>(val * 100);
            if (vol != m_volume) {
                m_volume = vol;
                emit volumeChanged();
            }
        }
        return;
    }

    // Fallback: pamixer
    proc.start("pamixer", QStringList() << "--get-volume");
    if (proc.waitForFinished(500) && proc.exitCode() == 0) {
        int vol = proc.readAllStandardOutput().trimmed().toInt();
        if (vol != m_volume) {
            m_volume = vol;
            emit volumeChanged();
        }
    }
}

void MythSystemSettings::setVolume(int percent)
{
    if (percent < 0) percent = 0;
    if (percent > 100) percent = 100;

    m_volume = percent;
    emit volumeChanged();

    // Set via wpctl or pamixer
    QProcess proc;
    double val = percent / 100.0;
    proc.start("wpctl", QStringList() << "set-volume" << "@DEFAULT_AUDIO_SINK@" << QString::number(val));
    if (!proc.waitForFinished(500)) {
        proc.start("pamixer", QStringList() << "--set-volume" << QString::number(percent));
        proc.waitForFinished(500);
    }
}

void MythSystemSettings::setMuted(bool mute)
{
    m_isMuted = mute;
    emit muteChanged();

    QProcess proc;
    proc.start("wpctl", QStringList() << "set-mute" << "@DEFAULT_AUDIO_SINK@" << (mute ? "1" : "0"));
    if (!proc.waitForFinished(500)) {
        proc.start("pamixer", QStringList() << (mute ? "--mute" : "--unmute"));
        proc.waitForFinished(500);
    }
}

void MythSystemSettings::queryBrightness()
{
    // Try brightnessctl
    QProcess proc;
    proc.start("brightnessctl", QStringList() << "g");
    if (proc.waitForFinished(500) && proc.exitCode() == 0) {
        int cur = proc.readAllStandardOutput().trimmed().toInt();
        QProcess maxProc;
        maxProc.start("brightnessctl", QStringList() << "m");
        if (maxProc.waitForFinished(500) && maxProc.exitCode() == 0) {
            int maxVal = maxProc.readAllStandardOutput().trimmed().toInt();
            if (maxVal > 0) {
                m_brightness = (cur * 100) / maxVal;
                emit brightnessChanged();
            }
        }
        return;
    }

    // Direct sysfs fallback
    QDir backlightDir("/sys/class/backlight");
    QStringList entries = backlightDir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
    if (!entries.isEmpty()) {
        QString path = "/sys/class/backlight/" + entries.first();
        QFile curFile(path + "/actual_brightness");
        QFile maxFile(path + "/max_brightness");
        if (curFile.open(QIODevice::ReadOnly) && maxFile.open(QIODevice::ReadOnly)) {
            int cur = curFile.readLine().trimmed().toInt();
            int maxVal = maxFile.readLine().trimmed().toInt();
            if (maxVal > 0) {
                m_brightness = (cur * 100) / maxVal;
                emit brightnessChanged();
            }
        }
    }
}

void MythSystemSettings::setBrightness(int percent)
{
    if (percent < 5) percent = 5;
    if (percent > 100) percent = 100;

    m_brightness = percent;
    emit brightnessChanged();

    QProcess proc;
    proc.start("brightnessctl", QStringList() << "set" << QString("%1%").arg(percent));
    proc.waitForFinished(500);
}

void MythSystemSettings::queryWifi()
{
    QProcess proc;
    proc.start("nmcli", QStringList() << "-t" << "-f" << "TYPE,STATE,CONNECTION" << "device");
    if (proc.waitForFinished(500) && proc.exitCode() == 0) {
        QString out = proc.readAllStandardOutput();
        QStringList lines = out.split('\n', Qt::SkipEmptyParts);
        bool foundWifi = false;

        for (const QString &line : lines) {
            if (line.startsWith("wifi:")) {
                QStringList parts = line.split(':');
                if (parts.size() >= 3) {
                    if (parts[1] == "connected") {
                        m_wifiEnabled = true;
                        m_wifiSSID = parts[2];
                        foundWifi = true;
                        break;
                    }
                }
            }
        }
        if (!foundWifi) {
            m_wifiSSID = "Not Connected";
        }
        emit wifiStateChanged();
    }
}

void MythSystemSettings::setWifiEnabled(bool enabled)
{
    m_wifiEnabled = enabled;
    emit wifiStateChanged();

    QProcess proc;
    proc.start("nmcli", QStringList() << "radio" << "wifi" << (enabled ? "on" : "off"));
    proc.waitForFinished(500);
}
