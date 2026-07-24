#include "terminalbackend.h"
#include <QDebug>
#include <pty.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/ioctl.h>
#include <stdlib.h>

MythTerminalBackend::MythTerminalBackend(QObject *parent)
    : QObject(parent)
{
    startPty();
}

MythTerminalBackend::~MythTerminalBackend()
{
    if (m_notifier) {
        m_notifier->setEnabled(false);
        delete m_notifier;
    }
    if (m_masterFd != -1) {
        close(m_masterFd);
    }
}

void MythTerminalBackend::startPty()
{
    struct winsize ws;
    ws.ws_col = 80;
    ws.ws_row = 24;
    ws.ws_xpixel = 0;
    ws.ws_ypixel = 0;

    m_pid = forkpty(&m_masterFd, nullptr, nullptr, &ws);
    if (m_pid < 0) {
        qWarning() << "MythTerminalBackend: Failed to forkpty";
        return;
    }

    if (m_pid == 0) {
        // Child Process
        setenv("TERM", "xterm-256color", 1);
        setenv("COLORTERM", "truecolor", 1);
        setenv("PS1", "\\[\\e[1;36m\\]mythos@localhost\\[\\e[0m\\]:\\[\\e[1;34m\\]\\w\\[\\e[0m\\]\\$ ", 1);

        const char *shell = getenv("SHELL");
        if (!shell) shell = "/bin/bash";

        execl(shell, shell, "-i", nullptr);
        exit(1);
    }

    // Parent Process
    int flags = fcntl(m_masterFd, F_GETFL, 0);
    fcntl(m_masterFd, F_SETFL, flags | O_NONBLOCK);

    m_notifier = new QSocketNotifier(m_masterFd, QSocketNotifier::Read, this);
    connect(m_notifier, &QSocketNotifier::activated, this, &MythTerminalBackend::onPtyReadReady);
}

void MythTerminalBackend::onPtyReadReady()
{
    char buffer[4096];
    ssize_t bytesRead = 0;

    while ((bytesRead = read(m_masterFd, buffer, sizeof(buffer) - 1)) > 0) {
        buffer[bytesRead] = '\0';
        QString chunk = QString::fromUtf8(buffer);
        
        m_fullOutput += chunk;
        if (m_fullOutput.size() > 50000) {
            m_fullOutput = m_fullOutput.right(40000);
        }

        emit outputReceived(chunk);
        emit outputChanged();
    }
}

void MythTerminalBackend::sendInput(const QString &input)
{
    if (m_masterFd == -1) return;
    QByteArray data = input.toUtf8();
    write(m_masterFd, data.constData(), data.size());
}

void MythTerminalBackend::clearTerminal()
{
    m_fullOutput.clear();
    emit outputChanged();
}
