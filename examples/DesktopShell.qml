import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import MythUI 1.0
import "pages"

Item {
    id: root
    anchors.fill: parent

    // App State Model
    ListModel {
        id: appModel
        ListElement { appId: "terminal"; title: "Myth Terminal"; icon: "terminal"; isOpen: false; isActive: false; componentName: "MythTerminalPage" }
        ListElement { appId: "hub"; title: "Myth Hub"; icon: "hub"; isOpen: false; isActive: false; componentName: "MythHubPage" }
        ListElement { appId: "center"; title: "Myth Center"; icon: "settings"; isOpen: false; isActive: false; componentName: "MythCenterPage" }
        ListElement { appId: "store"; title: "Myth Store"; icon: "store"; isOpen: false; isActive: false; componentName: "MythStorePage" }
        ListElement { appId: "ai"; title: "Myth AI"; icon: "ai"; isOpen: false; isActive: false; componentName: "MythAIPage" }
        ListElement { appId: "handoff"; title: "Developer Handoff"; icon: "handoff"; isOpen: false; isActive: false; componentName: "DeveloperHandoffPage" }
    }

    // Signals for Overlays
    property bool isCommandOpen: false
    property bool isControlCenterOpen: false
    property bool showNotification: true

    function openApp(id) {
        for (var i = 0; i < appModel.count; i++) {
            if (appModel.get(i).appId === id) {
                appModel.setProperty(i, "isOpen", true);
                focusApp(id);
            }
        }
        isCommandOpen = false;
        isControlCenterOpen = false;
    }

    function closeApp(id) {
        for (var i = 0; i < appModel.count; i++) {
            if (appModel.get(i).appId === id) {
                appModel.setProperty(i, "isOpen", false);
                appModel.setProperty(i, "isActive", false);
            }
        }
    }

    function focusApp(id) {
        for (var i = 0; i < appModel.count; i++) {
            appModel.setProperty(i, "isActive", appModel.get(i).appId === id);
        }
    }

    // Time Formatting
    property string currentTimeString: ""
    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: {
            var d = new Date();
            var h = d.getHours().toString().padStart(2, '0');
            var m = d.getMinutes().toString().padStart(2, '0');
            currentTimeString = h + ":" + m;
        }
        Component.onCompleted: triggered()
    }

    // Background
    MythGridBackground {
        anchors.fill: parent
    }
    
    // Radial gradients
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        // Fake radial gradients for performance
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            width: parent.width * 1.5
            height: parent.height
            radius: width / 2
            color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.03)
            opacity: 0.5
            transform: Scale { yScale: 0.3 }
        }
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            width: parent.width * 1.5
            height: parent.height
            radius: width / 2
            color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.03)
            opacity: 0.5
            transform: Scale { yScale: 0.3 }
        }
    }

    // Window Manager (Desktop Area)
    Item {
        id: desktopArea
        anchors.fill: parent
        anchors.topMargin: 60 // Below top bar
        anchors.bottomMargin: 80 // Above dock
        
        Repeater {
            model: appModel
            delegate: Item {
                width: desktopArea.width
                height: desktopArea.height
                visible: model.isOpen
                z: model.isActive ? 10 : 1
                
                MythWindow {
                    id: appWindow
                    width: Math.min(1000, parent.width - 40)
                    height: Math.min(700, parent.height - 40)
                    x: (parent.width - width) / 2 + (index * 20)
                    y: (parent.height - height) / 2 + (index * 20)
                    windowTitle: model.title
                    
                    onCloseClicked: root.closeApp(model.appId)
                    onFocused: root.focusApp(model.appId)
                    
                    border.color: model.isActive ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.3) : MythColors.borderSubtle
                    border.width: 1

                    Loader {
                        anchors.fill: parent
                        anchors.margins: 1
                        source: "pages/" + model.componentName + ".qml"
                        active: model.isOpen
                    }
                }
            }
        }
    }

    // Top Bar (Floating)
    MythCard {
        id: topBar
        width: parent.width - 16
        height: 40
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        color: Qt.rgba(MythColors.elevated.r, MythColors.elevated.g, MythColors.elevated.b, 0.65)
        radius: 12
        z: 100
        
        Row {
            id: leftSide
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.verticalCenter: parent.verticalCenter
            spacing: 16
            
            MythIcon {
                name: "cmd"
                iconColor: MythColors.mythCyan
                iconSize: 16
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text: "MYTH"
                color: MythColors.textPrimary
                font.family: MythTypography.uiFont
                font.pixelSize: 13
                font.bold: true
                font.letterSpacing: 1.5
                anchors.verticalCenter: parent.verticalCenter
            }
            Rectangle { width: 1; height: 16; color: MythColors.borderStrong; anchors.verticalCenter: parent.verticalCenter }
            Text {
                text: "Workspace 1"
                color: MythColors.textSecondary
                font.family: MythTypography.uiFont
                font.pixelSize: 13
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        
        Row {
            id: rightSide
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.verticalCenter: parent.verticalCenter
            spacing: 12
                
                Rectangle {
                    color: root.isControlCenterOpen ? Qt.rgba(255,255,255,0.1) : "transparent"
                    radius: 8
                    width: quickRow.implicitWidth + 16
                    height: 28
                    anchors.verticalCenter: parent.verticalCenter
                    
                    Row {
                        id: quickRow
                        anchors.centerIn: parent
                        spacing: 10
                        MythIcon { name: "ai"; iconColor: MythColors.mythPurple; iconSize: 14; anchors.verticalCenter: parent.verticalCenter }
                        MythIcon { name: "wifi"; iconColor: MythColors.textSecondary; iconSize: 14; anchors.verticalCenter: parent.verticalCenter }
                        MythIcon { name: "volume"; iconColor: MythColors.textSecondary; iconSize: 14; anchors.verticalCenter: parent.verticalCenter }
                        MythIcon { name: "battery"; iconColor: MythColors.textSecondary; iconSize: 14; anchors.verticalCenter: parent.verticalCenter }
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: root.isControlCenterOpen = !root.isControlCenterOpen
                    }
                }
                
                Rectangle { width: 1; height: 16; color: MythColors.borderStrong; anchors.verticalCenter: parent.verticalCenter }
                
                Text {
                    text: root.currentTimeString
                    color: MythColors.textPrimary
                    font.family: MythTypography.uiFont
                    font.pixelSize: 13
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
                
                Rectangle { width: 1; height: 16; color: MythColors.borderStrong; anchors.verticalCenter: parent.verticalCenter }
                
                MythIcon {
                    name: "bell"
                    iconColor: MythColors.textSecondary
                    iconSize: 14
                    anchors.verticalCenter: parent.verticalCenter
                    MouseArea {
                        anchors.fill: parent
                        anchors.margins: -10
                        onClicked: root.showNotification = true
                    }
                }
            }
        }

    // Dock (Bottom)
    MythCard {
        id: dock
        width: dockRow.implicitWidth + 32
        height: 64
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        anchors.horizontalCenter: parent.horizontalCenter
        color: Qt.rgba(MythColors.elevated.r, MythColors.elevated.g, MythColors.elevated.b, 0.65)
        radius: 24
        z: 100
        
        Row {
            id: dockRow
            anchors.centerIn: parent
            spacing: 12
            
            // Command Button
            Rectangle {
                width: 48
                height: 48
                radius: 12
                color: root.isCommandOpen ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.2) : Qt.rgba(255,255,255,0.05)
                border.color: root.isCommandOpen ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.5) : "transparent"
                border.width: 1
                
                MythIcon {
                    name: "search"
                    iconColor: root.isCommandOpen ? MythColors.mythCyan : MythColors.textPrimary
                    iconSize: 20
                    anchors.centerIn: parent
                }
                
                MouseArea {
                    anchors.fill: parent
                    onClicked: root.isCommandOpen = !root.isCommandOpen
                }
            }
            
            Rectangle { width: 1; height: 32; color: MythColors.borderStrong; anchors.verticalCenter: parent.verticalCenter }
            
            Repeater {
                model: appModel
                delegate: Rectangle {
                    width: 48
                    height: 48
                    radius: 12
                    color: model.isOpen ? Qt.rgba(255,255,255,0.1) : "transparent"
                    
                    MythIcon {
                        anchors.centerIn: parent
                        name: model.icon
                        iconColor: model.isOpen ? MythColors.mythCyan : MythColors.textSecondary
                        iconSize: 20
                    }
                    
                    // Active indicator
                    Rectangle {
                        width: 6
                        height: 6
                        radius: 3
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -2
                        anchors.horizontalCenter: parent.horizontalCenter
                        visible: model.isOpen
                        color: model.isActive ? MythColors.mythCyan : MythColors.textSecondary
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.color = Qt.rgba(255,255,255,0.05)
                        onExited: parent.color = model.isOpen ? Qt.rgba(255,255,255,0.1) : "transparent"
                        onClicked: root.openApp(model.appId)
                    }
                }
            }
            
            Rectangle { width: 1; height: 32; color: MythColors.borderStrong; anchors.verticalCenter: parent.verticalCenter }
            
            Rectangle {
                width: 48
                height: 48
                radius: 12
                color: "transparent"
                
                MythIcon {
                    name: "power"
                    iconColor: MythColors.error
                    iconSize: 18
                    anchors.centerIn: parent
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = Qt.rgba(MythColors.error.r, MythColors.error.g, MythColors.error.b, 0.1)
                    onExited: parent.color = "transparent"
                }
            }
        }
    }
    
    // Overlays
    Loader {
        anchors.fill: parent
        active: root.isCommandOpen
        source: "MythCommandOverlay.qml"
        z: 200
    }
    
    Loader {
        anchors.fill: parent
        active: root.isControlCenterOpen
        source: "ControlCenterOverlay.qml"
        z: 200
    }
    
    Loader {
        anchors.fill: parent
        active: root.showNotification
        source: "NotificationOverlay.qml"
        z: 200
    }
    
    // Keyboard Shortcut (Mock Super+Space)
    Item {
        focus: true
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Space && (event.modifiers & Qt.ControlModifier)) {
                root.isCommandOpen = !root.isCommandOpen;
                event.accepted = true;
            } else if (event.key === Qt.Key_Escape && root.isCommandOpen) {
                root.isCommandOpen = false;
                event.accepted = true;
            }
        }
    }
}
