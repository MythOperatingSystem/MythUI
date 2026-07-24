#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "systemmetrics.h"
#include "terminalbackend.h"
#include "systemsettings.h"
#include "packagemanager.h"
#include "aiservice.h"
#include "waylandcompositor.h"

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
    MythPackageManager packageManager;
    MythAIService aiService;
    MythWaylandCompositor waylandCompositor;

    engine.rootContext()->setContextProperty("systemMetrics", &systemMetrics);
    engine.rootContext()->setContextProperty("terminalBackend", &terminalBackend);
    engine.rootContext()->setContextProperty("systemSettings", &systemSettings);
    engine.rootContext()->setContextProperty("packageManager", &packageManager);
    engine.rootContext()->setContextProperty("aiService", &aiService);
    engine.rootContext()->setContextProperty("waylandCompositor", &waylandCompositor);
    
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("MythUIDemo", "Main");
    return app.exec();
}
