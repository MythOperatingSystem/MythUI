#ifndef PACKAGEMANAGER_H
#define PACKAGEMANAGER_H

#include <QObject>
#include <QProcess>
#include <QStringList>

class MythPackageManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isBusy READ isBusy NOTIFY statusChanged)
    Q_PROPERTY(QString currentApp READ currentApp NOTIFY statusChanged)
    Q_PROPERTY(int progressPercent READ progressPercent NOTIFY progressChanged)
    Q_PROPERTY(QString statusMessage READ statusMessage NOTIFY statusChanged)

public:
    explicit MythPackageManager(QObject *parent = nullptr);
    ~MythPackageManager();

    bool isBusy() const { return m_isBusy; }
    QString currentApp() const { return m_currentApp; }
    int progressPercent() const { return m_progressPercent; }
    QString statusMessage() const { return m_statusMessage; }

    Q_INVOKABLE void installPackage(const QString &appName, const QString &packageId, const QString &source);
    Q_INVOKABLE void uninstallPackage(const QString &appName, const QString &packageId);
    Q_INVOKABLE bool isInstalled(const QString &packageId);

signals:
    void statusChanged();
    void progressChanged();
    void packageInstalled(const QString &packageId, bool success);
    void packageUninstalled(const QString &packageId, bool success);

private slots:
    void onProcessOutputReady();
    void onProcessFinished(int exitCode, QProcess::ExitStatus exitStatus);

private:
    void checkSystemPackageManagers();

    QProcess *m_process = nullptr;
    bool m_isBusy = false;
    QString m_currentApp;
    QString m_currentPackageId;
    int m_progressPercent = 0;
    QString m_statusMessage;
    bool m_isInstalling = true;

    bool m_hasFlatpak = false;
    bool m_hasApt = false;
    bool m_hasPacman = false;
};

#endif // PACKAGEMANAGER_H
