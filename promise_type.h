struct promise_type {
    // suspend_always ó suspend_never
    
    // qué ocurre cuando la corutina es invocada la primera vez
    auto initial_suspend() { }
    // qué ocurre cuando la corutina termina
    auto final_suspend() { }

    // retorna un tipo que es convertible a un tipo coroutine_handle
    auto get_return_object() { }


    // guarda el valor cuando ejecutamos co_yield <valor>
    auto yield_value(Value_Type) { }
    // invocado por co_return cuando la corutina no es void
    auto return_value(Value_Type) { }
    // invocado por co_return cuando la corutina es void
    auto return_void() { }
};
