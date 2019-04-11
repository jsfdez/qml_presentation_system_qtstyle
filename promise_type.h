template <typename T>
struct promise_type {
    auto initial_suspend() {}
    auto final_suspend() {}

    auto get_return_object() {}

    auto yield_value(T) {}

    auto return_value(T) {}
    // or
    auto return_void() {}
};
