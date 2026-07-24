#ifndef WAYLANDCOMPOSITOR_H
#define WAYLANDCOMPOSITOR_H

#include <QObject>
#include <QStringList>
#include <QProcess>

class MythWaylandCompositor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isRunning READ isRunning NOTIFY stateChanged)
    Q_PROPERTY(QString socketName READ socketName NOTIFY stateChanged)

public:
    explicit MythWaylandCompositor(QObject *parent = nullptr);
    ~MythWaylandCompositor();

    bool isRunning() const { return m_isRunning; }
    QString socketName() const { return m_socketName; }

    Q_INVOKABLE void launchApplication(const QString &appCommand);

signals:
    void stateChanged();
    void appLaunched(const QString &cmd);

private:
    bool m_isRunning = false;
    QString m_socketName = "wayland-1";
};

#endif // WAYLANDCOMPOSITOR_H
