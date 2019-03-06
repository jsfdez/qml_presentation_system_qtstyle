auto operator co_await() {
    struct awaitable_type {
        // nos permite ahorrarnos el coste de suspender la corutina
        // cuando sabemos que la operación se va a completar de forma
        // síncrona
        bool await_ready() { }

        // es usado cuando la función que espera puede empezar una
        // operación asíncrona que puede ser completada síncronamente
        auto await_suspend(std::experimental::coroutine_handle<> awaiting) { }

        // el valor devuelto es el valor retornado en el punto que co_await
        // fue llamadao
        auto await_resume() { }
    };

    return awaitable_type{};
}
