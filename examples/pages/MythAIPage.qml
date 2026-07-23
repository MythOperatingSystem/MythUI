import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: availableWidth

        ColumnLayout {
            width: parent.width
            spacing: 24

            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 40
                spacing: 16

                // Page Badge
                RowLayout {
                    spacing: 8
                    Rectangle {
                        width: 24
                        height: 24
                        radius: 6
                        color: Qt.rgba(MythColors.textPrimary.r, MythColors.textPrimary.g, MythColors.textPrimary.b, 0.1)
                        Text {
                            anchors.centerIn: parent
                            text: "25"
                            font.pixelSize: 12
                            font.bold: true
                            color: MythColors.textPrimary
                        }
                    }
                    Text {
                        text: "Myth AI"
                        font.pixelSize: 13
                        font.bold: true
                        color: MythColors.textPrimary
                    }
                }

                // Page Title
                Text {
                    text: "Myth AI"
                    font.pixelSize: 32
                    font.bold: true
                    color: MythColors.textPrimary
                }

                // Page Subtitle
                Text {
                    text: "AI as an OS capability — not a chatbot. Transparent, confirmable, and privacy-first."
                    font.pixelSize: 15
                    color: MythColors.textSecondary
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    Layout.maximumWidth: root.width - 80
                }

                // AI Quick Panel Section
                Text {
                    text: "AI Quick Panel"
                    font.pixelSize: 11
                    font.bold: true
                    color: MythColors.textSecondary
                    Layout.topMargin: 24
                }

                Rectangle {
                    id: panelBg
                    width: 480
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 16
                    Layout.bottomMargin: 48
                    implicitHeight: qpCol.implicitHeight
                    color: Qt.rgba(23/255, 26/255, 36/255, 0.95)
                    border.color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.25)
                    border.width: 1
                    radius: 20

                    ColumnLayout {
                        id: qpCol
                        width: parent.width
                        spacing: 0

                        // Header
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 64

                            Rectangle {
                                width: parent.width
                                height: 1
                                anchors.bottom: parent.bottom
                                color: MythColors.borderSubtle
                            }

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 20
                                anchors.rightMargin: 20
                                spacing: 12

                                Rectangle {
                                    width: 32
                                    height: 32
                                    radius: 9
                                    color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.19)
                                    Text {
                                        anchors.centerIn: parent
                                        text: "◈"
                                        font.pixelSize: 16
                                        color: MythColors.mythPurple
                                    }
                                }

                                Text {
                                    text: "Myth AI"
                                    font.pixelSize: 15
                                    font.bold: true
                                    color: MythColors.textPrimary
                                }

                                Item { Layout.fillWidth: true }

                                Rectangle {
                                    width: badgeText.implicitWidth + 16
                                    height: 24
                                    radius: 12
                                    color: Qt.rgba(MythColors.success.r, MythColors.success.g, MythColors.success.b, 0.15)
                                    border.color: Qt.rgba(MythColors.success.r, MythColors.success.g, MythColors.success.b, 0.3)
                                    border.width: 1

                                    Text {
                                        id: badgeText
                                        anchors.centerIn: parent
                                        text: "Local"
                                        font.pixelSize: 11
                                        font.bold: true
                                        color: MythColors.success
                                    }
                                }
                            }
                        }

                        // Body
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: qpBody.implicitHeight + 32

                            Rectangle {
                                width: parent.width
                                height: 1
                                anchors.bottom: parent.bottom
                                color: MythColors.borderSubtle
                            }

                            ColumnLayout {
                                id: qpBody
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.topMargin: 16
                                anchors.bottomMargin: 16
                                anchors.leftMargin: 20
                                anchors.rightMargin: 20
                                spacing: 12

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: suggLayout.implicitHeight + 24
                                    radius: 12
                                    color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.06)
                                    border.color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.14)
                                    border.width: 1

                                    ColumnLayout {
                                        id: suggLayout
                                        anchors.top: parent.top
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.margins: 12
                                        spacing: 6

                                        Text {
                                            text: "AI SUGGESTION"
                                            font.pixelSize: 11
                                            font.bold: true
                                            color: MythColors.mythPurple
                                        }

                                        Text {
                                            text: "The error \"permission denied\" on /dev/kvm suggests your user is not in the <font color=\"" + MythColors.mythCyan + "\">kvm</font> group. Run:"
                                            font.pixelSize: 13
                                            color: MythColors.textPrimary
                                            wrapMode: Text.WordWrap
                                            textFormat: Text.RichText
                                            Layout.fillWidth: true
                                            Layout.maximumWidth: 400
                                        }

                                        Rectangle {
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: cmdText.implicitHeight + 12
                                            Layout.topMargin: 2
                                            radius: 6
                                            color: Qt.rgba(0, 229/255, 255/255, 0.05)

                                            Text {
                                                id: cmdText
                                                anchors.verticalCenter: parent.verticalCenter
                                                anchors.left: parent.left
                                                anchors.leftMargin: 10
                                                text: "sudo usermod -aG kvm $USER"
                                                font.family: "JetBrains Mono"
                                                font.pixelSize: 12
                                                color: MythColors.mythCyan
                                            }
                                        }
                                    }
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: reqConfLayout.implicitHeight + 20
                                    radius: 10
                                    color: MythColors.warningSubtle
                                    border.color: Qt.rgba(MythColors.warning.r, MythColors.warning.g, MythColors.warning.b, 0.25)
                                    border.width: 1

                                    ColumnLayout {
                                        id: reqConfLayout
                                        anchors.top: parent.top
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.margins: 10
                                        spacing: 4

                                        Text {
                                            text: "⚠ REQUIRES CONFIRMATION"
                                            font.pixelSize: 11
                                            font.bold: true
                                            color: MythColors.warning
                                        }

                                        Text {
                                            text: "This command modifies user group membership. A logout and login will be required."
                                            font.pixelSize: 12
                                            color: MythColors.textSecondary
                                            wrapMode: Text.WordWrap
                                            Layout.fillWidth: true
                                            Layout.maximumWidth: 400
                                        }
                                    }
                                }
                            }
                        }

                        // Footer Buttons
                        RowLayout {
                            Layout.fillWidth: true
                            Layout.margins: 12
                            Layout.leftMargin: 20
                            Layout.rightMargin: 20
                            spacing: 8

                            Rectangle {
                                width: 80
                                height: 32
                                radius: 6
                                color: "transparent"
                                Text {
                                    anchors.centerIn: parent
                                    text: "Dismiss"
                                    font.pixelSize: 13
                                    color: MythColors.textPrimary
                                }
                            }

                            Rectangle {
                                width: 100
                                height: 32
                                radius: 6
                                color: "transparent"
                                Text {
                                    anchors.centerIn: parent
                                    text: "Explain More"
                                    font.pixelSize: 13
                                    color: MythColors.textPrimary
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Rectangle {
                                width: 140
                                height: 32
                                radius: 6
                                color: MythColors.mythPurple
                                Text {
                                    anchors.centerIn: parent
                                    text: "Execute Command"
                                    font.pixelSize: 13
                                    font.bold: true
                                    color: "white"
                                }
                            }
                        }
                    }
                }

                // Grid layout for Capabilities and Trust States
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 32
                    
                    // Left column: AI Capabilities
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop
                        spacing: 8

                        Text {
                            text: "AI Capabilities"
                            font.pixelSize: 11
                            font.bold: true
                            color: MythColors.textSecondary
                            Layout.bottomMargin: 8
                        }

                        Repeater {
                            model: [
                                { icon: "Terminal", label: "Explain Errors", desc: "Analyze terminal errors and suggest fixes", color: MythColors.mythPurple },
                                { icon: "Terminal", label: "Generate Commands", desc: "Create shell commands from natural language", color: MythColors.mythPurple },
                                { icon: "Files", label: "Search Files", desc: "Find files by content, type, or context", color: MythColors.mythPurple },
                                { icon: "AI", label: "Summarize Text", desc: "Condense documents, logs, and output", color: MythColors.mythPurple },
                                { icon: "Settings", label: "Explain Settings", desc: "Describe what system settings control", color: MythColors.mythPurple },
                                { icon: "Security", label: "Analyze Security", desc: "Review permissions and audit logs", color: MythColors.mythPurple }
                            ]

                            delegate: Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: capLayout.implicitHeight + 28
                                radius: 12
                                color: Qt.rgba(MythColors.voidBlack.r, MythColors.voidBlack.g, MythColors.voidBlack.b, 0.4)
                                border.color: MythColors.borderSubtle
                                border.width: 1

                                RowLayout {
                                    id: capLayout
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.margins: 14
                                    spacing: 12

                                    Rectangle {
                                        width: 32
                                        height: 32
                                        radius: 8
                                        color: Qt.rgba(modelData.color.r, modelData.color.g, modelData.color.b, 0.09)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            text: modelData.icon === "Terminal" ? ">_" : (modelData.icon === "Files" ? "[/]" : (modelData.icon === "AI" ? "◈" : (modelData.icon === "Settings" ? "::" : "[x]")))
                                            color: modelData.color
                                            font.pixelSize: 14
                                        }
                                    }

                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 2
                                        
                                        Text {
                                            text: modelData.label
                                            font.pixelSize: 13
                                            font.bold: true
                                            color: MythColors.textPrimary
                                        }
                                        
                                        Text {
                                            text: modelData.desc
                                            font.pixelSize: 11
                                            color: MythColors.textSecondary
                                            wrapMode: Text.WordWrap
                                            Layout.fillWidth: true
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Right column: Trust & Permission States
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop
                        spacing: 8

                        Text {
                            text: "Trust & Permission States"
                            font.pixelSize: 11
                            font.bold: true
                            color: MythColors.textSecondary
                            Layout.bottomMargin: 8
                        }

                        Repeater {
                            model: [
                                { label: "Local Processing", desc: "Model runs on your hardware. Nothing leaves the device.", color: MythColors.success },
                                { label: "Cloud Processing", desc: "Request sent to MythOS cloud servers. Encrypted in transit.", color: MythColors.mythCyan },
                                { label: "Needs Terminal Access", desc: "AI wants to execute a command. Requires explicit confirmation.", color: MythColors.warning },
                                { label: "Needs File Access", desc: "AI needs to read a file. Review scope before allowing.", color: MythColors.warning },
                                { label: "Execution Blocked", desc: "AI action blocked by user policy. No system changes made.", color: MythColors.error }
                            ]

                            delegate: Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: trustLayout.implicitHeight + 28
                                radius: 12
                                color: Qt.rgba(MythColors.voidBlack.r, MythColors.voidBlack.g, MythColors.voidBlack.b, 0.4)
                                border.color: Qt.rgba(modelData.color.r, modelData.color.g, modelData.color.b, 0.14)
                                border.width: 1

                                ColumnLayout {
                                    id: trustLayout
                                    anchors.top: parent.top
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.margins: 14
                                    spacing: 6

                                    RowLayout {
                                        spacing: 10

                                        Rectangle {
                                            width: 8
                                            height: 8
                                            radius: 4
                                            color: modelData.color
                                        }

                                        Text {
                                            text: modelData.label
                                            font.pixelSize: 13
                                            font.bold: true
                                            color: modelData.color
                                        }
                                    }

                                    Text {
                                        text: modelData.desc
                                        font.pixelSize: 11
                                        color: MythColors.textSecondary
                                        wrapMode: Text.WordWrap
                                        Layout.fillWidth: true
                                        Layout.leftMargin: 18
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
