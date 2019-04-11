auto operator co_await(QNetworkReply &reply)
{
    struct awaitableType {
        QNetworkReply &reply;
        bool await_ready() { return reply.isFinished(); }
        auto await_suspend(std::experimental::coroutine_handle<> handle) {
            QObject::connect(&reply, &T::finished, QThread::currentThread(), [handle]() mutable {
                handle.resume();
            });
            return true;
        }
        auto await_resume() { return reply.readAll(); }
    };
    return awaitableType{ reply };
}
