cmake_minimum_required(VERSION 3.22)

project(MythUI
    VERSION 0.1
    LANGUAGES CXX
)


set(CMAKE_CXX_STANDARD 20)


find_package(Qt6 REQUIRED COMPONENTS
    Quick
    Qml
)


qt_standard_project_setup()


qt_add_library(MythUI STATIC)


target_link_libraries(MythUI
    PUBLIC
    Qt6::Quick
    Qt6::Qml
)


target_include_directories(MythUI
    PUBLIC
    src
)