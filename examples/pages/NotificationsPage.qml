import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    property var notificationItems: [
        { app: "Myth AI", title: "Analysis complete", body: "Your workspace has been scanned. 3 optimization suggestions found.", color: MythColors.mythPurple, time: "Just now", icon: "AI" },
        { app: "Myth Store", title: "Installation complete", body: "Docker 24.0.5 was installed successfully.", color: MythColors.success, time: "2m ago", icon: "Download" },
        { app: "Myth Update", title: "System update available", body: "MythOS 1.1.0 is ready to install. Requires restart.", color: MythColors.mythCyan, time: "15m ago", icon: "Download" },
        { app: "System", title: "Storage warning", body: "Root partition is 85% full. Consider clearing cache.", color: MythColors.warning, time: "1h ago", icon: "Files" },
        { app: "Security", title: "SSH login from 192.168.1.44", body: "New session started from internal network.", color: MythColors.error, time: "2h ago", icon: "Security" }
    ]

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: root.width
            spacing: 32

            // Page Header
            ColumnLayout {
                spacing: 8
                Layout.fillWidth: true
                Layout.margins: 20
                
                RowLayout {
                    spacing: 8
                    Rectangle {
                        width: 24
                        height: 24
                        radius: 6
                        color: Qt.alpha(MythColors.textPrimary, 0.1)
                        Text {
                            anchors.centerIn: parent
                            text: "18"
                            color: MythColors.textPrimary
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                        }
                    }
                    Text {
                        text: "Notifications"
                        color: MythColors.textSecondary
                        font.pixelSize: 14
                        font.weight: Font.Medium
                    }
                }

                Text {
                    text: "Notification System"
                    color: MythColors.textPrimary
                    font.pixelSize: 32
                    font.weight: Font.DemiBold
                }
                
                Text {
                    text: "Notification center with grouped, expandable, and actionable items."
                    color: MythColors.textSecondary
                    font.pixelSize: 16
                    Layout.fillWidth: true
                    wrapMode: Text.WordWrap
                }
            }

            GridLayout {
                columns: 2
                columnSpacing: 32
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20

                // Left Column: Notification Center
                ColumnLayout {
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    spacing: 16

                    Text {
                        text: "NOTIFICATION CENTER"
                        color: MythColors.textMuted
                        font.pixelSize: 12
                        font.letterSpacing: 1
                        font.weight: Font.DemiBold
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 400
                        color: Qt.rgba(23/255, 26/255, 36/255, 0.95)
                        border.color: MythColors.borderStrong
                        border.width: 1
                        radius: 20
                        clip: true

                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 0

                            // Header
                            Item {
                                Layout.fillWidth: true
                                height: 52
                                
                                Rectangle {
                                    anchors.bottom: parent.bottom
                                    width: parent.width
                                    height: 1
                                    color: MythColors.borderSubtle
                                }

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 20
                                    anchors.rightMargin: 20

                                    Text {
                                        text: "Notifications"
                                        color: MythColors.textPrimary
                                        font.pixelSize: 15
                                        font.weight: Font.DemiBold
                                        Layout.fillWidth: true
                                    }

                                    RowLayout {
                                        spacing: 8
                                        Button {
                                            text: "Clear All"
                                        }
                                        Icon {
                                            name: "Settings"
                                            size: 16
                                            color: MythColors.textMuted
                                        }
                                    }
                                }
                            }

                            // List
                            ListView {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                clip: true
                                model: notificationItems
                                delegate: Item {
                                    width: ListView.view.width
                                    height: delegateLayout.implicitHeight + 28
                                    
                                    Rectangle {
                                        anchors.bottom: parent.bottom
                                        width: parent.width
                                        height: 1
                                        color: MythColors.borderSubtle
                                    }

                                    RowLayout {
                                        id: delegateLayout
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.margins: 14
                                        anchors.leftMargin: 20
                                        anchors.rightMargin: 20
                                        spacing: 12

                                        // Icon
                                        Rectangle {
                                            width: 32
                                            height: 32
                                            radius: 8
                                            color: Qt.alpha(modelData.color, 0.2)
                                            Layout.alignment: Qt.AlignTop
                                            Layout.topMargin: 2

                                            Icon {
                                                anchors.centerIn: parent
                                                name: modelData.icon
                                                size: 16
                                                color: modelData.color
                                            }
                                        }

                                        // Content
                                        ColumnLayout {
                                            Layout.fillWidth: true
                                            spacing: 3

                                            RowLayout {
                                                Layout.fillWidth: true
                                                Text {
                                                    text: modelData.app
                                                    color: modelData.color
                                                    font.pixelSize: 11
                                                    font.weight: Font.DemiBold
                                                    Layout.fillWidth: true
                                                }
                                                Text {
                                                    text: modelData.time
                                                    color: MythColors.textMuted
                                                    font.pixelSize: 9
                                                    font.family: "JetBrains Mono"
                                                }
                                            }

                                            Text {
                                                text: modelData.title
                                                color: MythColors.textPrimary
                                                font.pixelSize: 13
                                                font.weight: Font.DemiBold
                                                Layout.fillWidth: true
                                            }

                                            Text {
                                                text: modelData.body
                                                color: MythColors.textSecondary
                                                font.pixelSize: 12
                                                lineHeight: 1.5
                                                Layout.fillWidth: true
                                                wrapMode: Text.WordWrap
                                            }
                                        }
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                    }
                                }
                            }
                        }
                    }
                }

                // Right Column: Notification Popup
                ColumnLayout {
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    spacing: 16

                    Text {
                        text: "NOTIFICATION POPUP"
                        color: MythColors.textMuted
                        font.pixelSize: 12
                        font.letterSpacing: 1
                        font.weight: Font.DemiBold
                    }

                    ColumnLayout {
                        spacing: 8
                        Layout.fillWidth: true

                        Repeater {
                            model: notificationItems.slice(0, 3)
                            delegate: Rectangle {
                                width: parent.width
                                height: popupLayout.implicitHeight + 28
                                radius: 14
                                color: Qt.rgba(23/255, 26/255, 36/255, 0.95)
                                border.color: Qt.alpha(modelData.color, 0.3)
                                border.width: 1

                                RowLayout {
                                    id: popupLayout
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.margins: 14
                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16
                                    spacing: 12
                                    
                                    // Icon
                                    Rectangle {
                                        width: 36
                                        height: 36
                                        radius: 10
                                        color: Qt.alpha(modelData.color, 0.2)
                                        border.color: Qt.alpha(modelData.color, 0.4)
                                        border.width: 1
                                        Layout.alignment: Qt.AlignTop

                                        Icon {
                                            anchors.centerIn: parent
                                            name: modelData.icon
                                            size: 18
                                            color: modelData.color
                                        }
                                    }

                                    // Content
                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 2

                                        Text {
                                            text: modelData.app
                                            color: modelData.color
                                            font.pixelSize: 11
                                            font.weight: Font.DemiBold
                                            Layout.fillWidth: true
                                            Layout.bottomMargin: 2
                                        }

                                        Text {
                                            text: modelData.title
                                            color: MythColors.textPrimary
                                            font.pixelSize: 13
                                            font.weight: Font.DemiBold
                                            Layout.fillWidth: true
                                            Layout.bottomMargin: 1
                                        }

                                        Text {
                                            text: modelData.body
                                            color: MythColors.textSecondary
                                            font.pixelSize: 12
                                            Layout.fillWidth: true
                                            wrapMode: Text.WordWrap
                                        }

                                        RowLayout {
                                            visible: index === 0
                                            Layout.topMargin: 10
                                            spacing: 8
                                            
                                            Button {
                                                text: "Dismiss"
                                            }
                                            Button {
                                                text: "View Suggestions"
                                            }
                                        }
                                    }

                                    Icon {
                                        Layout.alignment: Qt.AlignTop
                                        name: "Close"
                                        size: 14
                                        color: MythColors.textMuted
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
