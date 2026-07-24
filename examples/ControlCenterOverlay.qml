import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import MythUI 1.0

Item {
    id: overlay
    anchors.fill: parent
    
    MouseArea {
        anchors.fill: parent
        onClicked: overlay.parent.parent.isControlCenterOpen = false
    }
    
    MythCard {
        width: 320
        height: 380
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.top: parent.top
        anchors.topMargin: 56
        color: Qt.rgba(MythColors.elevated.r, MythColors.elevated.g, MythColors.elevated.b, 0.65)
        border.color: MythColors.borderStrong
        border.width: 1
        radius: 24
        

        
        MouseArea {
            anchors.fill: parent
        }
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 24
            
            // Toggles
            RowLayout {
                Layout.fillWidth: true
                spacing: 12
                
                // Wifi
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    radius: 16
                    color: MythColors.mythCyan
                    
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        MythIcon { name: "wifi"; iconColor: MythColors.voidBlack; iconSize: 20 }
                        Item { Layout.fillHeight: true }
                        Text { text: "Wi-Fi"; color: MythColors.voidBlack; font.bold: true; font.pixelSize: 13 }
                        Text { text: "Myth_5G"; color: Qt.rgba(0,0,0,0.7); font.pixelSize: 11 }
                    }
                    
                    MouseArea { anchors.fill: parent }
                }
                
                // Bluetooth
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    radius: 16
                    color: Qt.rgba(255,255,255,0.05)
                    border.color: MythColors.borderSubtle
                    border.width: 1
                    
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        MythIcon { name: "bluetooth"; iconColor: MythColors.mythPurple; iconSize: 20 }
                        Item { Layout.fillHeight: true }
                        Text { text: "Bluetooth"; color: MythColors.textPrimary; font.bold: true; font.pixelSize: 13 }
                        Text { text: "On"; color: MythColors.textSecondary; font.pixelSize: 11 }
                    }
                    
                    MouseArea { anchors.fill: parent }
                }
            }
            
            // Sliders
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 16
                
                // Brightness
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12
                    MythIcon { name: "cmd"; iconColor: MythColors.textSecondary; iconSize: 16 }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 6
                        radius: 3
                        color: MythColors.surface
                        Rectangle {
                            width: parent.width * 0.7
                            height: parent.height
                            radius: parent.radius
                            color: MythColors.mythCyan
                        }
                    }
                }
                
                // Volume
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12
                    MythIcon { name: "volume"; iconColor: MythColors.textSecondary; iconSize: 16 }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 6
                        radius: 3
                        color: MythColors.surface
                        Rectangle {
                            width: parent.width * 0.45
                            height: parent.height
                            radius: parent.radius
                            color: MythColors.mythCyan
                        }
                    }
                }
            }
            
            Item { Layout.fillHeight: true }
            
            // Bottom quick actions
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                color: MythColors.borderStrong
            }
            
            RowLayout {
                Layout.fillWidth: true
                
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 36
                    color: hoverBtn1.containsMouse ? Qt.rgba(255,255,255,0.1) : "transparent"
                    radius: 8
                    MythIcon { anchors.centerIn: parent; name: "tools"; iconColor: MythColors.textSecondary; iconSize: 16 }
                    MouseArea { id: hoverBtn1; anchors.fill: parent; hoverEnabled: true }
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 36
                    color: hoverBtn2.containsMouse ? Qt.rgba(255,255,255,0.1) : "transparent"
                    radius: 8
                    MythIcon { anchors.centerIn: parent; name: "user"; iconColor: MythColors.textSecondary; iconSize: 16 }
                    MouseArea { id: hoverBtn2; anchors.fill: parent; hoverEnabled: true }
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 36
                    color: hoverBtn3.containsMouse ? Qt.rgba(255,255,255,0.1) : "transparent"
                    radius: 8
                    MythIcon { anchors.centerIn: parent; name: "power"; iconColor: MythColors.error; iconSize: 16 }
                    MouseArea { id: hoverBtn3; anchors.fill: parent; hoverEnabled: true }
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 36
                    color: hoverBtn4.containsMouse ? Qt.rgba(255,255,255,0.1) : "transparent"
                    radius: 8
                    MythIcon { anchors.centerIn: parent; name: "bell"; iconColor: MythColors.textSecondary; iconSize: 16 }
                    MouseArea { id: hoverBtn4; anchors.fill: parent; hoverEnabled: true }
                }
            }
        }
    }
}
