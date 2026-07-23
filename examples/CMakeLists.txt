cmake_minimum_required(VERSION 3.22)

find_package(Qt6 REQUIRED COMPONENTS Quick Qml)

qt_add_executable(MythUIDemoApp
    main.cpp
)

qt_add_qml_module(MythUIDemoApp
    URI MythUIDemo
    VERSION 1.0
    OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/MythUIDemo"
    DEPENDENCIES
        MythUI
    QML_FILES
        Main.qml
        Demo.qml
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
)
