cmake_minimum_required(VERSION 3.10)

project(Coroutines)

set(CMAKE_CXX_STANDARD 17)
#set(CMAKE_REQUIRED_FLAGS -std=c++2a)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++2a -fcoroutines-ts -stdlib=libc++")

#add_compile_options(-fcoroutines-ts -stdlib=libc++)
add_compile_options(-std=c++20 -fcoroutines-ts -stdlib=libc++)

find_package(Qt5 COMPONENTS
    Core
    Network
    Widgets
    REQUIRED
)

link_libraries(
    Qt5::Core
    Qt5::Network
    Qt5::Widgets
)

#add_executable(Example
#    qcoroutine.h
#    main.cpp)

add_executable(MouseEvent
    mouseevent.cpp
)

add_executable(Fibonacci
    fibonacci.cpp
)

add_executable(Sporting
    sporting.cpp
)
