#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  engine.addImportPath("qrc:/");
  const QUrl url("qrc:/Main.qml");

  QObject::connect(
    &engine,
    &QQmlApplicationEngine::objectCreated,
    &app,
    [url](QObject *obj, const QUrl &objUrl) {
      if (!obj && url == objUrl) QCoreApplication::exit(-1);
    },
    Qt::QueuedConnection);
  // engine.loadFromModule("5-QMLModulesqmldirResources", "Main"); // qt6 feature
  engine.load(url);
  return app.exec();
}
