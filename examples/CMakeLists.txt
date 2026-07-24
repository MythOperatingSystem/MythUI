cmake_minimum_required(VERSION 3.22)

find_package(Qt6 REQUIRED COMPONENTS Quick Qml)

find_library(UTIL_LIB util)

qt_add_executable(MythUIDemoApp
    main.cpp
    ../src/systemmetrics.cpp
    ../src/systemmetrics.h
    ../src/terminalbackend.cpp
    ../src/terminalbackend.h
    ../src/systemsettings.cpp
    ../src/systemsettings.h
)

target_include_directories(MythUIDemoApp PRIVATE ../src)

qt_add_qml_module(MythUIDemoApp
    URI MythUIDemo
    VERSION 1.0
    OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/MythUIDemo"
    DEPENDENCIES
        MythUI
    QML_FILES
        Main.qml
        Demo.qml
        DesktopShell.qml
        MythCommandOverlay.qml
        ControlCenterOverlay.qml
        NotificationOverlay.qml
        pages/PageBadge.qml
        pages/Glass.qml
        pages/PageH1.qml
        pages/PageSub.qml
        pages/SectionTag.qml
        pages/CoverPage.qml
        pages/ProductPrinciplesPage.qml
        pages/BrandPage.qml
        pages/DesignTokensPage.qml
        pages/TypographyPage.qml
        pages/IconographyPage.qml
        pages/CoreComponentsPage.qml
        pages/AdvancedComponentsPage.qml
        pages/BootExperiencePage.qml
        pages/DesktopShellPage.qml
        pages/MythCommandPage.qml
        pages/ControlCenterPage.qml
        pages/NotificationsPage.qml
        pages/SystemDialogsPage.qml
        pages/MythCenterPage.qml
        pages/MythHubPage.qml
        pages/MythTerminalPage.qml
        pages/MythStorePage.qml
        pages/MythAIPage.qml
        pages/DeveloperHandoffPage.qml
)

target_link_libraries(MythUIDemoApp
    PRIVATE
        Qt6::Quick
        Qt6::Qml
        MythUI
        ${UTIL_LIB}
)
