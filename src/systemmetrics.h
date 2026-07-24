#ifndef SYSTEMMETRICS_H
#define SYSTEMMETRICS_H

#include <QObject>
#include <QTimer>
#include <QString>

class MythSystemMetrics : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double cpuUsage READ cpuUsage NOTIFY metricsUpdated)
    Q_PROPERTY(double ramUsagePercent READ ramUsagePercent NOTIFY metricsUpdated)
    Q_PROPERTY(double ramUsedGB READ ramUsedGB NOTIFY metricsUpdated)
    Q_PROPERTY(double ramTotalGB READ ramTotalGB NOTIFY metricsUpdated)
    Q_PROPERTY(double netRxKbps READ netRxKbps NOTIFY metricsUpdated)
    Q_PROPERTY(double netTxKbps READ netTxKbps NOTIFY metricsUpdated)

public:
    explicit MythSystemMetrics(QObject *parent = nullptr);

    double cpuUsage() const { return m_cpuUsage; }
    double ramUsagePercent() const { return m_ramUsagePercent; }
    double ramUsedGB() const { return m_ramUsedGB; }
    double ramTotalGB() const { return m_ramTotalGB; }
    double netRxKbps() const { return m_netRxKbps; }
    double netTxKbps() const { return m_netTxKbps; }

signals:
    void metricsUpdated();

private slots:
    void updateMetrics();

private:
    void readCpuStats(unsigned long long &idle, unsigned long long &total);
    void readRamStats();
    void readNetStats(unsigned long long &rxBytes, unsigned long long &txBytes);

    QTimer m_timer;
    
    double m_cpuUsage = 0.0;
    double m_ramUsagePercent = 0.0;
    double m_ramUsedGB = 0.0;
    double m_ramTotalGB = 0.0;
    double m_netRxKbps = 0.0;
    double m_netTxKbps = 0.0;

    unsigned long long m_prevCpuIdle = 0;
    unsigned long long m_prevCpuTotal = 0;
    unsigned long long m_prevRxBytes = 0;
    unsigned long long m_prevTxBytes = 0;
};

#endif // SYSTEMMETRICS_H
