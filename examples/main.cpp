#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "systemmetrics.h"
#include "terminalbackend.h"
#include "systemsettings.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    
    // Add binary directory import path so engine resolves MythUI module from build tree
    engine.addImportPath(app.applicationDirPath() + "/..");
    engine.addImportPath(app.applicationDirPath());

    // Register C++ system services into QML root context
    MythSystemMetrics systemMetrics;
    MythTerminalBackend terminalBackend;
    MythSystemSettings systemSettings;

    engine.rootContext()->setContextProperty("systemMetrics", &systemMetrics);
    engine.rootContext()->setContextProperty("terminalBackend", &terminalBackend);
    engine.rootContext()->setContextProperty("systemSettings", &systemSettings);
    
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("MythUIDemo", "Main");
    return app.exec();
}
