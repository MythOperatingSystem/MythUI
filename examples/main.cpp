#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    
    // Add import paths for QML module resolution in build directory
    engine.addImportPath(app.applicationDirPath() + "/..");
    engine.addImportPath(app.applicationDirPath() + "/../qml");
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
