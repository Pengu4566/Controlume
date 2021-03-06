//
// Run in release mode for better performances
//

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
#include <QTimer>
#include <QObject>
#include "controller.h"
#include "interfacemanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    int argumentCount = QCoreApplication::arguments().size();
    QStringList argumentList = QCoreApplication::arguments();
    QTextStream standardOutput(stdout);

    QString sendOscHost = "108.254.124.93";
    quint16 sendOscPort = 7000;
    quint16 receiveOscPort = 15555;

    if (argumentCount > 1) {
        sendOscHost = argumentList.at(1);
    }
    if (argumentCount > 2) {
        sendOscPort = argumentList.at(2).toInt();
    }
    if (argumentCount > 3) {
        receiveOscPort = argumentList.at(3).toInt();
    }
    if (argumentCount == 1) {
        standardOutput << QObject::tr("To specify an OSC send host and port: %1 <sendHost> <sendPort> <receivePort").arg(
                argumentList.first()) << endl;
    }

    //double xvalue=ui->Slider->value();



    standardOutput << QObject::tr("Receive OSC on port %1").arg(receiveOscPort) << endl;
    standardOutput << QObject::tr("Send OSC to %1:%2").arg(sendOscHost).arg(sendOscPort) << endl;

    Controller controller(sendOscHost, sendOscPort, receiveOscPort, &app);

    QQmlApplicationEngine engine;
    // Pass a C++ object to QML.
    // Note: It's considered bad practice to do the opposite. Always access C++ methods, signals and properties from QML,
    // and not the other way around.
    QScopedPointer<InterfaceManager> board(new InterfaceManager);
    engine.rootContext()->setContextProperty("board", board.data());
    engine.rootContext()->setContextProperty("controller", &controller);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    int ret = app.exec();
    return ret;
}
