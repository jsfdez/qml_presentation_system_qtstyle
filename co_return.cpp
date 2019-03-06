#include <QtCore>
#include "qcoroutine.h"

int main(int, char **)
{
    return *[]() -> QSynchronousCoroutine<int> {
        qInfo("Comienzo");
        auto asyncCoroutine = []() -> QAsynchronousCoroutine<QString> {
            qInfo("Haciendo una tarea costosa");
            co_return QLatin1String("olakease");
        }();
        qDebug("Obtenemos la coroutina");
        qInfo("Respuesta asíncrona: %s",
              qPrintable(co_await asyncCoroutine));
        qDebug("...");
        qDebug("Ok, intentémoslo de nuevo: %s",
               qPrintable(co_await asyncCoroutine));
        co_return 0;
    }();
}
