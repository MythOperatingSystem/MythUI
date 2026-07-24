#include "waylandcompositor.h"
#include <QProcess>
#include <QDebug>

MythWaylandCompositor::MythWaylandCompositor(QObject *parent)
    : QObject(parent)
{
    m_isRunning = true;
    m_socketName = "wayland-1";
    emit stateChanged();
}

MythWaylandCompositor::~MythWaylandCompositor()
{
}

void MythWaylandCompositor::launchApplication(const QString &appCommand)
{
    if (appCommand.trimmed().isEmpty()) return;

    QProcess *proc = new QProcess(this);
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    env.insert("WAYLAND_DISPLAY", m_socketName);
    proc->setProcessEnvironment(env);

    proc->start("/bin/bash", QStringList() << "-c" << appCommand);
    emit appLaunched(appCommand);
}
