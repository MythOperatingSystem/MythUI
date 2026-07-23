import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    ScrollView {
        id: scrollView
        anchors.fill: parent
        clip: true
        contentWidth: availableWidth

        Item {
            width: scrollView.availableWidth
            implicitHeight: mainLayout.implicitHeight + 80

            ColumnLayout {
                id: mainLayout
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 40
                spacing: 24

                // PAGE HEADER
                ColumnLayout {
                    spacing: 8

                    RowLayout {
                        spacing: 8
                        Rectangle {
                            width: 24
                            height: 24
                            color: MythColors.mythCyan
                            radius: 12

                            Text {
                                text: "19"
                                color: MythColors.voidBlack
                                anchors.centerIn: parent
                                font.pixelSize: 12
                                font.bold: true
                            }
                        }

                        Text {
                            text: "System Dialogs"
                            color: MythColors.mythCyan
                            font.pixelSize: 12
                            font.bold: true
                            font.capitalization: Font.AllUppercase
                        }
                    }

                    Text {
                        text: "System Dialogs"
                        color: MythColors.textPrimary
                        font.pixelSize: 32
                        font.bold: true
                    }

                    Text {
                        text: "Confirmation, permission, destructive action, and AI consent dialogs."
                        color: MythColors.textSecondary
                        font.pixelSize: 15
                        Layout.maximumWidth: 600
                        wrapMode: Text.WordWrap
                    }
                }

                // DIALOGS GRID
                GridLayout {
                    columns: 2
                    columnSpacing: 20
                    rowSpacing: 20
                    Layout.fillWidth: true
                    Layout.topMargin: 16

                    Repeater {
                        model: [
                            { type: "confirmation", icon: "Power", color: MythColors.textSecondary, title: "Shut Down?", body: "All open applications will be closed. Unsaved work will be lost.", actions: ["Cancel", "Shut Down"] },
                            { type: "destructive", icon: "Close", color: MythColors.error, title: "Force Quit Application?", body: "Forcing an application to quit may cause data loss. Save your work before continuing.", actions: ["Cancel", "Force Quit"] },
                            { type: "permission", icon: "Security", color: MythColors.mythCyan, title: "Microphone Access", body: "Myth Terminal is requesting access to your microphone. This permission will be limited to the current session.", actions: ["Deny", "Allow Once", "Allow Always"] },
                            { type: "ai", icon: "AI", color: MythColors.purple, title: "AI Command Execution", body: "MythAI wants to execute: \"sudo systemctl restart myth-compositor\". Review and confirm before proceeding.", actions: ["Cancel", "Review Script", "Execute"] },
                            { type: "warning", icon: "Notifications", color: MythColors.warning, title: "Storage Almost Full", body: "Root partition is 91% full. System performance may be affected. Clear cache or move files to free space.", actions: ["Dismiss", "Open Storage Settings"] }
                        ]

                        delegate: Rectangle {
                            id: dialogCard
                            property var dialogData: modelData

                            color: Qt.rgba(0, 0, 0, 0.2)
                            border.color: Qt.rgba(dialogData.color.r, dialogData.color.g, dialogData.color.b, 0.15)
                            border.width: 1
                            radius: 12
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignTop
                            implicitHeight: contentCol.implicitHeight + 56

                            ColumnLayout {
                                id: contentCol
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.margins: 28
                                spacing: 0

                                Rectangle {
                                    width: 40
                                    height: 40
                                    radius: 12
                                    color: Qt.rgba(dialogData.color.r, dialogData.color.g, dialogData.color.b, 0.1)
                                    border.color: Qt.rgba(dialogData.color.r, dialogData.color.g, dialogData.color.b, 0.25)
                                    border.width: 1
                                    Layout.bottomMargin: 16

                                    Text {
                                        text: dialogData.icon
                                        color: dialogData.color
                                        anchors.centerIn: parent
                                        font.pixelSize: 20
                                    }
                                }

                                Text {
                                    text: dialogData.title
                                    color: MythColors.textPrimary
                                    font.pixelSize: 15
                                    font.bold: true
                                    Layout.bottomMargin: 8
                                }

                                Text {
                                    text: dialogData.body
                                    color: MythColors.textSecondary
                                    font.pixelSize: 13
                                    Layout.fillWidth: true
                                    wrapMode: Text.WordWrap
                                    lineHeight: 1.6
                                    lineHeightMode: Text.ProportionalHeight
                                    Layout.bottomMargin: 20
                                }

                                Rectangle {
                                    visible: dialogData.type === "ai"
                                    Layout.fillWidth: true
                                    implicitHeight: 32
                                    radius: 8
                                    color: Qt.rgba(MythColors.purple.r, MythColors.purple.g, MythColors.purple.b, 0.06)
                                    border.color: Qt.rgba(MythColors.purple.r, MythColors.purple.g, MythColors.purple.b, 0.19)
                                    border.width: 1
                                    Layout.bottomMargin: 16

                                    Text {
                                        text: "sudo systemctl restart myth-compositor"
                                        color: MythColors.purple
                                        font.family: "JetBrains Mono, monospace"
                                        font.pixelSize: 11
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 12
                                    }
                                }

                                RowLayout {
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignRight
                                    spacing: 8
                                    
                                    Item { Layout.fillWidth: true } // spacer
                                    
                                    Repeater {
                                        model: dialogData.actions
                                        delegate: Rectangle {
                                            property bool isLast: index === dialogData.actions.length - 1
                                            property bool isDestructive: dialogData.type === "destructive"
                                            property bool isAi: dialogData.type === "ai"
                                            
                                            property color btnColor: isLast ? (isDestructive ? MythColors.error : (isAi ? MythColors.purple : MythColors.mythCyan)) : "transparent"
                                            property color textColor: isLast ? MythColors.voidBlack : MythColors.textPrimary

                                            implicitWidth: btnText.implicitWidth + 24
                                            implicitHeight: 32
                                            radius: 6
                                            color: btnColor

                                            Text {
                                                id: btnText
                                                text: modelData
                                                color: parent.textColor
                                                font.pixelSize: 13
                                                font.bold: true
                                                anchors.centerIn: parent
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
    }
}
