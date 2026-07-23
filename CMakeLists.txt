cmake_minimum_required(VERSION 3.22)

project(MythUI
    VERSION 0.1.0
    DESCRIPTION "MythOS UI Component Library"
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Qml)

qt_standard_project_setup()

# MythUI QML Module
qt_add_qml_module(MythUI
    URI MythUI
    VERSION 1.0
    OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/MythUI"
    QML_FILES
        qml/MythButton.qml
        qml/MythCard.qml
        qml/MythWindow.qml
        qml/MythDialog.qml
        qml/MythNotification.qml
        qml/MythTextField.qml
        qml/MythToggle.qml
        qml/MythSlider.qml
        qml/MythProgressBar.qml
        qml/MythToolTip.qml
        qml/theme/MythColors.qml
        qml/theme/MythTypography.qml
        qml/theme/MythSpacing.qml
        qml/theme/MythMotion.qml
)

target_link_libraries(MythUI
    PRIVATE
        Qt6::Quick
        Qt6::Qml
)

# Example application
add_subdirectory(examples)
