import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: pageRoot
    anchors.fill: parent

    property var blocks: [
        { type: "command", text: "git clone https://github.com/mythos/kernel-modules.git", color: MythColors.mythCyan },
        { type: "output", text: "Cloning into 'kernel-modules'...\nremote: Enumerating objects: 1842, done.\nreceiving objects: 100% (1842/1842), 4.21 MiB done.", color: MythColors.textSecondary },
        { type: "command", text: "sudo dmesg | tail -20", color: MythColors.mythCyan },
        { type: "error", text: "dmesg: read kernel buffer failed: Operation not permitted", color: MythColors.error },
        { type: "ai", text: "◈ AI Explanation: This error means the command requires elevated privileges. Consider running with sudo or adjusting kernel.dmesg_restrict in sysctl.", color: MythColors.purple },
        { type: "command", text: "sudo sysctl kernel.dmesg_restrict=0", color: MythColors.mythCyan },
        { type: "output", text: "kernel.dmesg_restrict = 0", color: MythColors.success }
    ]

    Component {
        id: commandComponent
        RowLayout {
            spacing: 0
            Text {
                text: "myth@ws ~ $ "
                color: MythColors.mythCyan
                font.family: "JetBrains Mono"
                font.pixelSize: 13
            }
            Text {
                text: blockData.text
                color: MythColors.textPrimary
                font.family: "JetBrains Mono"
                font.pixelSize: 13
            }
        }
    }

    Component {
        id: outputComponent
        Text {
            text: blockData.text
            color: blockData.color
            font.family: "JetBrains Mono"
            font.pixelSize: 13
            wrapMode: Text.NoWrap
        }
    }

    Component {
        id: errorComponent
        Rectangle {
            width: parent.width
            implicitHeight: errorText.implicitHeight + 8
            color: Qt.rgba(MythColors.error.r, MythColors.error.g, MythColors.error.b, 0.08)
            radius: 4
            
            Rectangle {
                width: 2
                height: parent.height
                color: MythColors.error
                anchors.left: parent.left
            }

            Text {
                id: errorText
                text: blockData.text
                color: MythColors.error
                font.family: "JetBrains Mono"
                font.pixelSize: 13
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                wrapMode: Text.Wrap
            }
        }
    }

    Component {
        id: aiComponent
        Rectangle {
            width: parent.width
            implicitHeight: aiText.implicitHeight + 16
            color: Qt.rgba(MythColors.purple.r, MythColors.purple.g, MythColors.purple.b, 0.08)
            border.color: Qt.rgba(MythColors.purple.r, MythColors.purple.g, MythColors.purple.b, 0.3)
            radius: 8
            
            Text {
                id: aiText
                text: blockData.text
                color: MythColors.purple
                font.family: "JetBrains Mono"
                font.pixelSize: 13
                anchors.fill: parent
                anchors.margins: 8
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                wrapMode: Text.Wrap
            }
        }
    }

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: pageRoot.width
            spacing: 0
            
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
            }

            // PageBadge
            RowLayout {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                spacing: 8
                Rectangle {
                    width: 24; height: 24
                    radius: 4
                    color: MythColors.mythCyan
                    Text { text: "22"; color: MythColors.voidBlack; anchors.centerIn: parent; font.pixelSize: MythTypography.bodySmall; font.bold: true }
                }
                Text { text: "Myth Terminal"; color: MythColors.mythCyan; font.pixelSize: MythTypography.bodySmall; font.bold: true }
            }

            // PageH1
            Text {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                text: "Myth Terminal"
                color: MythColors.textPrimary
                font.pixelSize: MythTypography.h1
                Layout.topMargin: 16
            }

            // PageSub
            Text {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                text: "Developer-focused terminal with AI assistance, tabs, and trust levels."
                color: MythColors.textSecondary
                font.pixelSize: MythTypography.body
                wrapMode: Text.WordWrap
                Layout.topMargin: 8
                Layout.bottomMargin: 48
            }

            // Glass container
            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.preferredHeight: contentCol.implicitHeight
                Layout.bottomMargin: 48
                color: Qt.rgba(255/255, 255/255, 255/255, 0.02)
                border.color: MythColors.borderSubtle
                radius: 12
                clip: true

                ColumnLayout {
                    id: contentCol
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 0

                    // Tabs
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 40
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.02)
                        
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: MythColors.borderSubtle
                        }

                        RowLayout {
                            anchors.fill: parent
                            spacing: 0

                            Repeater {
                                model: ["myth@ws ~ ×", "ssh prod-01 ×", "+"]
                                delegate: Rectangle {
                                    Layout.preferredHeight: 40
                                    Layout.preferredWidth: tabRow.implicitWidth + 36
                                    color: index === 0 ? Qt.rgba(255/255, 255/255, 255/255, 0.04) : "transparent"
                                    
                                    Rectangle {
                                        anchors.right: parent.right
                                        height: parent.height
                                        width: 1
                                        color: MythColors.borderSubtle
                                    }

                                    RowLayout {
                                        id: tabRow
                                        anchors.centerIn: parent
                                        spacing: 8
                                        
                                        Text {
                                            visible: index < 2
                                            text: ">_"
                                            font.pixelSize: 12
                                            color: index === 0 ? MythColors.mythCyan : MythColors.textMuted
                                        }

                                        Text {
                                            text: modelData
                                            font.pixelSize: 12
                                            color: index === 0 ? MythColors.textPrimary : MythColors.textMuted
                                        }
                                    }
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                    }
                                }
                            }

                            Item { Layout.fillWidth: true }

                            RowLayout {
                                spacing: 8
                                Layout.rightMargin: 14
                                Repeater {
                                    model: [MythColors.error, MythColors.warning, MythColors.success]
                                    delegate: Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: modelData
                                        opacity: 0.7
                                    }
                                }
                            }
                        }
                    }

                    // Terminal Content
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: terminalLayout.implicitHeight + 32
                        
                        ColumnLayout {
                            id: terminalLayout
                            anchors.fill: parent
                            anchors.margins: 16
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20
                            spacing: 4

                            ScrollView {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 320
                                clip: true
                                contentWidth: availableWidth

                                TextArea {
                                    id: termOutputText
                                    width: parent.width
                                    text: terminalBackend ? terminalBackend.fullOutput : "Welcome to MythOS Terminal (PTY Engine)\n\n$ "
                                    color: MythColors.textPrimary
                                    font.family: "JetBrains Mono"
                                    font.pixelSize: 13
                                    readOnly: true
                                    wrapMode: Text.Wrap
                                    background: null
                                    selectByMouse: true
                                    onTextChanged: {
                                        cursorPosition = text.length;
                                    }
                                }
                            }

                            // Active interactive prompt line
                            RowLayout {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 36
                                spacing: 8

                                Text {
                                    text: "myth@mythos $ "
                                    color: MythColors.mythCyan
                                    font.family: "JetBrains Mono"
                                    font.pixelSize: 13
                                    font.bold: true
                                }

                                TextInput {
                                    id: termInput
                                    Layout.fillWidth: true
                                    color: MythColors.textPrimary
                                    font.family: "JetBrains Mono"
                                    font.pixelSize: 13
                                    focus: true
                                    onAccepted: {
                                        if (terminalBackend && text.length > 0) {
                                            terminalBackend.sendInput(text + "\n");
                                            text = "";
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Status bar
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 32
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.02)
                        
                        Rectangle {
                            anchors.top: parent.top
                            width: parent.width
                            height: 1
                            color: MythColors.borderSubtle
                        }

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 18
                            anchors.rightMargin: 18
                            spacing: 16

                            Text {
                                text: "zsh — main"
                                color: MythColors.textMuted
                                font.family: "JetBrains Mono"
                                font.pixelSize: 10
                            }

                            // Badge
                            Rectangle {
                                color: Qt.rgba(MythColors.success.r, MythColors.success.g, MythColors.success.b, 0.1)
                                border.color: Qt.rgba(MythColors.success.r, MythColors.success.g, MythColors.success.b, 0.3)
                                radius: 4
                                width: safeText.implicitWidth + 12
                                height: safeText.implicitHeight + 4
                                Text {
                                    id: safeText
                                    text: "Safe"
                                    color: MythColors.success
                                    font.pixelSize: 10
                                    anchors.centerIn: parent
                                }
                            }

                            Item { Layout.fillWidth: true }

                            RowLayout {
                                spacing: 8
                                Text {
                                    text: "◈ AI Assist"
                                    color: MythColors.purple
                                    font.family: "JetBrains Mono"
                                    font.pixelSize: 10
                                }
                                Text {
                                    text: "80×24 — UTF-8"
                                    color: MythColors.textMuted
                                    font.family: "JetBrains Mono"
                                    font.pixelSize: 10
                                }
                            }
                        }
                    }
                }
            }

            // SectionTag
            Text {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                text: "Command Trust Levels"
                color: MythColors.textMuted
                font.pixelSize: MythTypography.bodySmall
                font.bold: true
                Layout.bottomMargin: 10
            }

            // Grid Layout for Trust Levels
            GridLayout {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.bottomMargin: 40
                columns: 4
                columnSpacing: 10
                rowSpacing: 10

                Repeater {
                    model: [
                        { level: "Safe", desc: "Standard user-space commands", color: MythColors.success },
                        { level: "Needs Review", desc: "Elevated permissions or network access", color: MythColors.mythCyan },
                        { level: "Administrative", desc: "sudo or root required", color: MythColors.warning },
                        { level: "Destructive", desc: "rm -rf, dd, mkfs — explicit confirmation", color: MythColors.error }
                    ]
                    delegate: Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: contentColGrid.implicitHeight + 36
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.03)
                        border.color: Qt.rgba(modelData.color.r, modelData.color.g, modelData.color.b, 0.15)
                        radius: 8

                        ColumnLayout {
                            id: contentColGrid
                            anchors.fill: parent
                            anchors.margins: 18
                            spacing: 10

                            // Badge
                            Rectangle {
                                color: Qt.rgba(modelData.color.r, modelData.color.g, modelData.color.b, 0.1)
                                border.color: Qt.rgba(modelData.color.r, modelData.color.g, modelData.color.b, 0.3)
                                radius: 4
                                width: badgeText.implicitWidth + 12
                                height: badgeText.implicitHeight + 4
                                Text {
                                    id: badgeText
                                    text: modelData.level
                                    color: modelData.color
                                    font.pixelSize: 11
                                    anchors.centerIn: parent
                                }
                            }

                            Text {
                                text: modelData.desc
                                color: MythColors.textSecondary
                                font.pixelSize: 12
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                            }
                            Item { Layout.fillHeight: true }
                        }
                    }
                }
            }
        }
    }
}
