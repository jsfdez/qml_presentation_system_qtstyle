#include <QtCore/qdebug.h>
#include <QtCore/qfile.h>
#include <QtCore/qlocale.h>
#include <QtCore/qstring.h>
#include <QtGui/qguiapplication.h>
#include <QtQml/qjsvalue.h>
#include <QtQml/qqmlapplicationengine.h>

int main(int argc, char **argv)
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QLocale::setDefault(QLocale::English);
    QGuiApplication app(argc, argv);
    app.setApplicationName("<title>");
    app.setOrganizationName("jsfdez");

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:///imports");

    if (QFile::exists(":/imports/Qt.labs.presentation/qmldir"))
        qDebug() << "File exists";

    qmlRegisterSingletonType("Presentation", 1, 0, "Constants",
                             [](QQmlEngine *engine, QJSEngine *scriptEngine)
    {
        Q_UNUSED(engine)
        auto singleton = scriptEngine->newObject();

        auto url = QStringLiteral("https://github.com/jsfdez/qpresentation/tree/%1").arg(BRANCH);

        singleton.setProperty(QStringLiteral("title"), qGuiApp->applicationName());
        singleton.setProperty(QStringLiteral("url"), url);
        return singleton;
    });
    engine.load(QUrl("qrc:///qml/main.qml"));
    return app.exec();
}
