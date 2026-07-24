#ifndef TERMINALBACKEND_H
#define TERMINALBACKEND_H

#include <QObject>
#include <QSocketNotifier>
#include <QString>
#include <sys/types.h>

class MythTerminalBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString fullOutput READ fullOutput NOTIFY outputChanged)

public:
    explicit MythTerminalBackend(QObject *parent = nullptr);
    ~MythTerminalBackend();

    QString fullOutput() const { return m_fullOutput; }

    Q_INVOKABLE void sendInput(const QString &input);
    Q_INVOKABLE void clearTerminal();

signals:
    void outputReceived(const QString &text);
    void outputChanged();

private slots:
    void onPtyReadReady();

private:
    void startPty();

    int m_masterFd = -1;
    pid_t m_pid = -1;
    QSocketNotifier *m_notifier = nullptr;
    QString m_fullOutput;
};

#endif // TERMINALBACKEND_H
