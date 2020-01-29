#include <QtCore/qdebug.h>
#include <QtCore/qfile.h>
#include <QtCore/qlocale.h>
#include <QtCore/qstring.h>
#include <QtQml/qqmlapplicationengine.h>
#include <QtQuick/qquickview.h>
#include <QtWidgets/qapplication.h>

#include "NativeInterface.h"

template<class OBJECT>
QObject *singletonProvider(QQmlEngine *qmlEngine, QJSEngine *jsEngine)
{
    Q_UNUSED(jsEngine);
    return new OBJECT(qmlEngine);
}

int main(int argc, char **argv)
{
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    QLocale::setDefault(QLocale::English);
    QApplication app(argc, argv);
    app.setApplicationName("Qt for WebAssembly");
    app.setOrganizationName("jsfdez");

    qmlRegisterSingletonType<NativeInterface>("Presentation", 1, 0, "NativeInterface",
                                              &singletonProvider<NativeInterface>);

    QQuickView quickView;
    quickView.setResizeMode(QQuickView::SizeRootObjectToView);
    auto &engine = *quickView.engine();
    engine.addImportPath("qrc:///imports");
    quickView.setSource(QUrl("qrc:///qml/main.qml"));
    if (app.arguments().contains("-fullscreen"))
        quickView.showFullScreen();
    else
        quickView.show();
    return app.exec();
}
