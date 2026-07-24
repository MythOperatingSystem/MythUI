import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import MythUI 1.0

Rectangle {
    id: overlay
    anchors.fill: parent
    color: Qt.rgba(MythColors.voidBlack.r, MythColors.voidBlack.g, MythColors.voidBlack.b, 0.6)
    
    MouseArea {
        anchors.fill: parent
        onClicked: overlay.parent.parent.isCommandOpen = false
    }
    
    MythCard {
        width: 600
        height: 400
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.2
        radius: 16
        color: MythColors.surface
        border.color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.4)
        

        
        MouseArea {
            anchors.fill: parent
            // Eat clicks so they don't close the overlay
        }
        
        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            
            // Search Input Area
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 64
                color: MythColors.elevated
                radius: 16
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: MythColors.borderStrong
                }
                
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 24
                    anchors.rightMargin: 24
                    spacing: 16
                    
                    MythIcon { name: "search"; iconColor: MythColors.mythCyan; iconSize: 20 }
                    
                    TextInput {
                        id: searchInput
                        Layout.fillWidth: true
                        font.pixelSize: 20
                        color: MythColors.textPrimary
                        focus: true
                        Text {
                            anchors.fill: parent
                            text: "Search apps, files, or ask Myth AI..."
                            color: MythColors.textSecondary
                            font.pixelSize: 20
                            visible: searchInput.text === ""
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
            
            // Results Area
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 8
                    
                    Text {
                        text: "SUGGESTED ACTIONS"
                        color: MythColors.textSecondary
                        font.family: MythTypography.uiFont
                        font.pixelSize: 11
                        font.bold: true
                        Layout.leftMargin: 12
                        visible: searchInput.text === ""
                    }
                    
                    // Suggestion 1
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 64
                        radius: 12
                        color: hover1.containsMouse ? Qt.rgba(255,255,255,0.05) : "transparent"
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            spacing: 16
                            
                            Rectangle {
                                width: 40; height: 40; radius: 10
                                color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.1)
                                MythIcon { name: "terminal"; anchors.centerIn: parent; iconColor: MythColors.mythCyan; iconSize: 18 }
                            }
                            
                            ColumnLayout {
                                spacing: 2
                                Text { text: "Open Myth Terminal"; color: MythColors.textPrimary; font.bold: true; font.pixelSize: 14 }
                                Text { text: "System Application"; color: MythColors.textSecondary; font.pixelSize: 12 }
                            }
                        }
                        
                        MouseArea {
                            id: hover1
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: overlay.parent.parent.openApp("terminal")
                        }
                    }
                    
                    // Suggestion 2
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 64
                        radius: 12
                        color: hover2.containsMouse ? Qt.rgba(255,255,255,0.05) : "transparent"
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            spacing: 16
                            
                            Rectangle {
                                width: 40; height: 40; radius: 10
                                color: Qt.rgba(255,255,255,0.05)
                                MythIcon { name: "tools"; anchors.centerIn: parent; iconColor: MythColors.textPrimary; iconSize: 18 }
                            }
                            
                            ColumnLayout {
                                spacing: 2
                                Text { text: "System Settings"; color: MythColors.textPrimary; font.bold: true; font.pixelSize: 14 }
                                Text { text: "Myth Center"; color: MythColors.textSecondary; font.pixelSize: 12 }
                            }
                        }
                        
                        MouseArea {
                            id: hover2
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: overlay.parent.parent.openApp("center")
                        }
                    }
                    
                    // Dynamic AI Suggestion
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 64
                        radius: 12
                        color: hover3.containsMouse ? Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.1) : Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.05)
                        border.color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.2)
                        visible: searchInput.text !== ""
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            spacing: 16
                            
                            Rectangle {
                                width: 40; height: 40; radius: 10
                                color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.2)
                                MythIcon { name: "ai"; anchors.centerIn: parent; iconColor: MythColors.mythPurple; iconSize: 18 }
                            }
                            
                            ColumnLayout {
                                spacing: 2
                                Text { text: "Ask Myth AI: \"" + searchInput.text + "\""; color: MythColors.textPrimary; font.bold: true; font.pixelSize: 14 }
                                Text { text: "Execute intelligent action"; color: MythColors.mythPurple; font.pixelSize: 12 }
                            }
                        }
                        
                        MouseArea {
                            id: hover3
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                    
                    Item { Layout.fillHeight: true }
                }
            }
            
            // Footer
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                color: MythColors.elevated
                radius: 16
                Rectangle {
                    anchors.top: parent.top
                    width: parent.width
                    height: 1
                    color: MythColors.borderStrong
                }
                
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 24
                    anchors.rightMargin: 24
                    
                    Text { text: "Use ↑ ↓ to navigate"; color: MythColors.textSecondary; font.pixelSize: 11 }
                    Item { Layout.fillWidth: true }
                    Text { text: "Enter to select"; color: MythColors.textSecondary; font.pixelSize: 11 }
                }
            }
        }
    }
}
