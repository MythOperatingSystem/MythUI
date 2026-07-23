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

# Set singletons explicitly
set_source_files_properties(
    qml/theme/MythColors.qml
    qml/theme/MythTypography.qml
    qml/theme/MythSpacing.qml
    qml/theme/MythMotion.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

# MythUI QML Module
qt_add_qml_module(MythUI
    URI MythUI
    VERSION 1.0
    OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/MythUI"
    QML_FILES
        qml/MythButton.qml
        qml/MythCard.qml
        examples/pages/AdvancedComponentsPage.qml
        examples/pages/PageBadge.qml
        examples/pages/PageH1.qml
        examples/pages/PageSub.qml
        examples/pages/SectionTag.qml
        examples/pages/Glass.qml
        qml/MythGridBackground.qml
        qml/MythWindow.qml
        qml/MythDialog.qml
        qml/MythNotification.qml
        qml/MythTextField.qml
        qml/MythToggle.qml
        qml/MythSlider.qml
        qml/MythProgressBar.qml
        qml/MythToolTip.qml
        qml/MythBadge.qml
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
