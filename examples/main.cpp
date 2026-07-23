#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    
    // Add binary directory import path so engine resolves MythUI module from build tree
    engine.addImportPath(app.applicationDirPath() + "/..");
    engine.addImportPath(app.applicationDirPath());
    
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("MythUIDemo", "Main");
    return app.exec();
}
