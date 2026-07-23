cmake_minimum_required(VERSION 3.22)

find_package(Qt6 REQUIRED COMPONENTS Quick Qml)

qt_add_executable(MythUIDemoApp
    main.cpp
)

qt_add_qml_module(MythUIDemoApp
    URI MythUIDemo
    VERSION 1.0
    QML_FILES
        main.qml
        Demo.qml
)

target_link_libraries(MythUIDemoApp
    PRIVATE
        Qt6::Quick
        Qt6::Qml
        MythUI
)
