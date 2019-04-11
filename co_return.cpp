int main(int, char **)
{
    return *[]() -> QSynchronousCoroutine<int> {
        qDebug("1");
        auto asyncCoroutine = []() -> QAsynchronousCoroutine<QString> {
            qDebug("3");
            co_return QLatin1String("olakease");
        }();
        qDebug("2");
        qInfo("4: %s", qPrintable(co_await asyncCoroutine));
        qDebug("5: %s", qPrintable(co_await asyncCoroutine));
        co_return 0;
    }();
}
