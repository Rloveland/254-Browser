//Authors: Nathan Tran, Reeder Loveland, Richard Vu
//CPSC 254-01 25615 Group Project
//This is the main driver file that begins the application and eventually terminates it
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    //Initializes the window and creates an application object
    QGuiApplication app(argc, argv);

    //Creates an engine object and makes the engine load main.qml
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    //Run the application until the user exits out
    return app.exec();
}
