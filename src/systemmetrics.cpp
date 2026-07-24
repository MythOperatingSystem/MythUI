#include "systemmetrics.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>

MythSystemMetrics::MythSystemMetrics(QObject *parent)
    : QObject(parent)
{
    // Initial read
    readCpuStats(m_prevCpuIdle, m_prevCpuTotal);
    readNetStats(m_prevRxBytes, m_prevTxBytes);
    readRamStats();

    connect(&m_timer, &QTimer::timeout, this, &MythSystemMetrics::updateMetrics);
    m_timer.start(1000); // 1 second interval
}

void MythSystemMetrics::readCpuStats(unsigned long long &idle, unsigned long long &total)
{
    QFile file("/proc/stat");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    QTextStream in(&file);
    QString line = in.readLine();
    file.close();

    if (!line.startsWith("cpu "))
        return;

    QStringList parts = line.split(' ', Qt::SkipEmptyParts);
    if (parts.size() < 5)
        return;

    unsigned long long user = parts[1].toULongLong();
    unsigned long long nice = parts[2].toULongLong();
    unsigned long long sys = parts[3].toULongLong();
    unsigned long long idleTime = parts[4].toULongLong();
    unsigned long long iowait = parts.size() > 5 ? parts[5].toULongLong() : 0;
    unsigned long long irq = parts.size() > 6 ? parts[6].toULongLong() : 0;
    unsigned long long softirq = parts.size() > 7 ? parts[7].toULongLong() : 0;
    unsigned long long steal = parts.size() > 8 ? parts[8].toULongLong() : 0;

    idle = idleTime + iowait;
    total = user + nice + sys + idleTime + iowait + irq + softirq + steal;
}

void MythSystemMetrics::readRamStats()
{
    QFile file("/proc/meminfo");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    QTextStream in(&file);
    unsigned long long totalKb = 0;
    unsigned long long availableKb = 0;

    while (!in.atEnd()) {
        QString line = in.readLine();
        if (line.startsWith("MemTotal:")) {
            QStringList parts = line.split(' ', Qt::SkipEmptyParts);
            if (parts.size() >= 2) totalKb = parts[1].toULongLong();
        } else if (line.startsWith("MemAvailable:")) {
            QStringList parts = line.split(' ', Qt::SkipEmptyParts);
            if (parts.size() >= 2) availableKb = parts[1].toULongLong();
        }
    }
    file.close();

    if (totalKb > 0) {
        m_ramTotalGB = totalKb / 1024.0 / 1024.0;
        unsigned long long usedKb = (totalKb > availableKb) ? (totalKb - availableKb) : 0;
        m_ramUsedGB = usedKb / 1024.0 / 1024.0;
        m_ramUsagePercent = (double)usedKb / (double)totalKb * 100.0;
    }
}

void MythSystemMetrics::readNetStats(unsigned long long &rxBytes, unsigned long long &txBytes)
{
    QFile file("/proc/net/dev");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    QTextStream in(&file);
    rxBytes = 0;
    txBytes = 0;

    // Skip headers
    in.readLine();
    in.readLine();

    while (!in.atEnd()) {
        QString line = in.readLine().trimmed();
        int colonIdx = line.indexOf(':');
        if (colonIdx == -1) continue;

        QString iface = line.left(colonIdx).trimmed();
        if (iface == "lo") continue; // Skip loopback

        QString dataStr = line.mid(colonIdx + 1).trimmed();
        QStringList parts = dataStr.split(' ', Qt::SkipEmptyParts);
        if (parts.size() >= 9) {
            rxBytes += parts[0].toULongLong();
            txBytes += parts[8].toULongLong();
        }
    }
    file.close();
}

void MythSystemMetrics::updateMetrics()
{
    // CPU
    unsigned long long idle, total;
    readCpuStats(idle, total);
    unsigned long long totalDiff = total - m_prevCpuTotal;
    unsigned long long idleDiff = idle - m_prevCpuIdle;
    if (totalDiff > 0) {
        m_cpuUsage = (double)(totalDiff - idleDiff) / (double)totalDiff * 100.0;
    }
    m_prevCpuIdle = idle;
    m_prevCpuTotal = total;

    // RAM
    readRamStats();

    // Net
    unsigned long long rx, tx;
    readNetStats(rx, tx);
    m_netRxKbps = (rx > m_prevRxBytes) ? (double)(rx - m_prevRxBytes) / 1024.0 : 0.0;
    m_netTxKbps = (tx > m_prevTxBytes) ? (double)(tx - m_prevTxBytes) / 1024.0 : 0.0;
    m_prevRxBytes = rx;
    m_prevTxBytes = tx;

    emit metricsUpdated();
}
