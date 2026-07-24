#include "packagemanager.h"
#include <QStandardPaths>
#include <QDebug>
#include <QRegularExpression>

MythPackageManager::MythPackageManager(QObject *parent)
    : QObject(parent)
{
    m_process = new QProcess(this);
    connect(m_process, &QProcess::readyReadStandardOutput, this, &MythPackageManager::onProcessOutputReady);
    connect(m_process, &QProcess::readyReadStandardError, this, &MythPackageManager::onProcessOutputReady);
    connect(m_process, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished), this, &MythPackageManager::onProcessFinished);

    checkSystemPackageManagers();
}

MythPackageManager::~MythPackageManager()
{
    if (m_process->state() != QProcess::NotRunning) {
        m_process->kill();
    }
}

void MythPackageManager::checkSystemPackageManagers()
{
    m_hasFlatpak = !QStandardPaths::findExecutable("flatpak").isEmpty();
    m_hasApt = !QStandardPaths::findExecutable("apt").isEmpty();
    m_hasPacman = !QStandardPaths::findExecutable("pacman").isEmpty();
}

bool MythPackageManager::isInstalled(const QString &packageId)
{
    if (packageId.isEmpty()) return false;

    if (m_hasFlatpak) {
        QProcess checkProc;
        checkProc.start("flatpak", QStringList() << "info" << packageId);
        if (checkProc.waitForFinished(1000) && checkProc.exitCode() == 0) {
            return true;
        }
    }
    return false;
}

void MythPackageManager::installPackage(const QString &appName, const QString &packageId, const QString &source)
{
    if (m_isBusy) return;

    m_isBusy = true;
    m_currentApp = appName;
    m_currentPackageId = packageId;
    m_progressPercent = 0;
    m_isInstalling = true;
    m_statusMessage = QString("Installing %1...").arg(appName);

    emit statusChanged();
    emit progressChanged();

    QStringList args;
    QString cmd = "flatpak";

    if (source.contains("Flatpak", Qt::CaseInsensitive) && m_hasFlatpak) {
        cmd = "flatpak";
        args << "install" << "--user" << "-y" << "flathub" << packageId;
    } else if (m_hasApt) {
        cmd = "pkexec";
        args << "apt" << "install" << "-y" << packageId;
    } else if (m_hasPacman) {
        cmd = "pkexec";
        args << "pacman" << "-S" << "--noconfirm" << packageId;
    } else {
        cmd = "flatpak";
        args << "install" << "--user" << "-y" << "flathub" << packageId;
    }

    m_process->start(cmd, args);
}

void MythPackageManager::uninstallPackage(const QString &appName, const QString &packageId)
{
    if (m_isBusy) return;

    m_isBusy = true;
    m_currentApp = appName;
    m_currentPackageId = packageId;
    m_progressPercent = 0;
    m_isInstalling = false;
    m_statusMessage = QString("Uninstalling %1...").arg(appName);

    emit statusChanged();
    emit progressChanged();

    QStringList args;
    args << "uninstall" << "--user" << "-y" << packageId;
    m_process->start("flatpak", args);
}

void MythPackageManager::onProcessOutputReady()
{
    QString output = QString::fromUtf8(m_process->readAllStandardOutput() + m_process->readAllStandardError());
    
    // Parse progress percentage (Flatpak outputs e.g. "Installing... 45%")
    static QRegularExpression percentRegex("(\\d+)%");
    QRegularExpressionMatch match = percentRegex.match(output);
    if (match.hasMatch()) {
        int pct = match.captured(1).toInt();
        if (pct > m_progressPercent) {
            m_progressPercent = pct;
            emit progressChanged();
        }
    }
}

void MythPackageManager::onProcessFinished(int exitCode, QProcess::ExitStatus exitStatus)
{
    Q_UNUSED(exitStatus);
    bool success = (exitCode == 0);

    m_isBusy = false;
    m_progressPercent = success ? 100 : 0;
    m_statusMessage = success ? (m_isInstalling ? "Installed" : "Uninstalled") : "Operation Failed";

    emit statusChanged();
    emit progressChanged();

    if (m_isInstalling) {
        emit packageInstalled(m_currentPackageId, success);
    } else {
        emit packageUninstalled(m_currentPackageId, success);
    }
}
