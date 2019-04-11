auto operator co_await() {
    struct awaitable_type {
        bool await_ready() { }

        auto await_suspend(std::experimental::coroutine_handle<> awaiting) { }

        auto await_resume() { }
    };

    return awaitable_type{};
}
