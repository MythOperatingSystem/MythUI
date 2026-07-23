import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import MythUI 1.0

Item {
    anchors.fill: parent

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 32

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 32 // Margin top
            }

            // PageHeader
            ColumnLayout {
                spacing: 8
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32

                RowLayout {
                    spacing: 8
                    MythBadge {
                        text: "07"
                        color: MythColors.cyan
                    }
                    Text {
                        text: "Core Components"
                        color: MythColors.text2
                        font: MythTypography.body
                    }
                }

                Text {
                    text: "Core Components"
                    color: MythColors.text
                    font: MythTypography.h1
                }

                Text {
                    text: "Reusable primitives for all MythOS applications."
                    color: MythColors.text2
                    font: MythTypography.body
                }
            }

            // Section 1
            ColumnLayout {
                spacing: 16
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32

                Text {
                    text: "MythButton — All Variants & Sizes"
                    color: MythColors.cyan
                    font: MythTypography.label
                }

                MythCard {
                    Layout.fillWidth: true

                    ColumnLayout {
                        spacing: 20
                        width: parent.width

                        Flow {
                            width: parent.width
                            spacing: 10

                            MythButton { variant: "primary"; text: "Primary" }
                            MythButton { variant: "secondary"; text: "Secondary" }
                            MythButton { variant: "ghost"; text: "Ghost" }
                            MythButton { variant: "ai"; text: "Ai" }
                            MythButton { variant: "danger"; text: "Danger" }
                            MythButton { variant: "success"; text: "Success" }
                        }

                        Flow {
                            width: parent.width
                            spacing: 10
                            
                            MythButton { variant: "primary"; size: "sm"; text: "Small" }
                            MythButton { variant: "primary"; size: "md"; text: "Medium" }
                            MythButton { variant: "primary"; size: "lg"; text: "Large" }
                            MythButton { variant: "primary"; enabled: false; text: "Disabled" }
                            MythButton { variant: "ai"; size: "md"; text: "◈ Ask AI" }
                        }
                    }
                }
            }

            // Section 2
            ColumnLayout {
                spacing: 16
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32

                Text {
                    text: "MythInput — All States"
                    color: MythColors.cyan
                    font: MythTypography.label
                }

                MythCard {
                    Layout.fillWidth: true

                    GridLayout {
                        columns: 2
                        columnSpacing: 20
                        rowSpacing: 20
                        width: parent.width

                        // Default
                        ColumnLayout {
                            spacing: 6
                            Layout.fillWidth: true
                            Text { text: "Default"; color: MythColors.text2; font: MythTypography.body }
                            MythTextField {
                                placeholderText: "Enter workspace name..."
                                Layout.fillWidth: true
                            }
                        }

                        // Focused
                        ColumnLayout {
                            spacing: 6
                            Layout.fillWidth: true
                            Text { text: "Focused"; color: MythColors.text2; font: MythTypography.body }
                            MythTextField {
                                placeholderText: "Search commands..."
                                text: "myth"
                                focus: true
                                Layout.fillWidth: true
                            }
                        }

                        // Error
                        ColumnLayout {
                            spacing: 6
                            Layout.fillWidth: true
                            Text { text: "Error"; color: MythColors.text2; font: MythTypography.body }
                            MythTextField {
                                placeholderText: "API key..."
                                text: "invalid-key-xxx"
                                // Mocking error state if MythTextField supports it
                                // error: true 
                                Layout.fillWidth: true
                            }
                            Text {
                                text: "Invalid API key format."
                                color: MythColors.error
                                font: MythTypography.body
                            }
                        }

                        // Disabled
                        ColumnLayout {
                            spacing: 6
                            Layout.fillWidth: true
                            Text { text: "Disabled"; color: MythColors.text2; font: MythTypography.body }
                            MythTextField {
                                placeholderText: "System reserved"
                                enabled: false
                                Layout.fillWidth: true
                            }
                        }
                    }
                }
            }

            // Section 3
            ColumnLayout {
                spacing: 16
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32

                Text {
                    text: "MythBadge — All Variants"
                    color: MythColors.cyan
                    font: MythTypography.label
                }

                MythCard {
                    Layout.fillWidth: true

                    Flow {
                        width: parent.width
                        spacing: 10

                        MythBadge { text: "Neutral"; color: MythColors.text2 }
                        MythBadge { text: "Active"; color: MythColors.cyan }
                        MythBadge { text: "AI"; color: MythColors.purple }
                        MythBadge { text: "Success"; color: MythColors.success }
                        MythBadge { text: "Warning"; color: MythColors.warning }
                        MythBadge { text: "Error"; color: MythColors.error }
                        MythBadge { text: "New"; color: MythColors.cyan }
                        MythBadge { text: "Beta"; color: MythColors.purpleHover }
                    }
                }
            }

            // Section 4
            ColumnLayout {
                spacing: 16
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32

                Text {
                    text: "MythNotification — All Types"
                    color: MythColors.cyan
                    font: MythTypography.label
                }

                ColumnLayout {
                    spacing: 8
                    Layout.maximumWidth: 520
                    Layout.fillWidth: true

                    Repeater {
                        model: ListModel {
                            ListElement { type: "info"; msg: "System update available — MythOS 1.1.0"; colorHex: "#00E5FF" }
                            ListElement { type: "success"; msg: "Application installed successfully."; colorHex: "#00E676" }
                            ListElement { type: "warning"; msg: "Storage usage exceeds 85% threshold."; colorHex: "#FFD600" }
                            ListElement { type: "error"; msg: "Connection lost — Retrying in 5s..."; colorHex: "#FF1744" }
                            ListElement { type: "ai"; msg: "AI assistant finished analyzing your workspace."; colorHex: "#D500F9" }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 52
                            radius: 12
                            color: Qt.rgba(19/255, 21/255, 31/255, 0.9)
                            border.color: MythColors.borderSubtle

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 12
                                spacing: 12

                                Rectangle {
                                    width: 28
                                    height: 28
                                    radius: 7
                                    color: Qt.darker(model.colorHex, 1.8)

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        radius: 4
                                        color: model.colorHex
                                        anchors.centerIn: parent
                                    }
                                }

                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 2
                                    Text {
                                        text: model.type.toUpperCase()
                                        font.family: "JetBrains Mono"
                                        font.pixelSize: 9
                                        color: model.colorHex
                                    }
                                    Text {
                                        text: model.msg
                                        color: MythColors.text
                                        font.pixelSize: 13
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Section 5
            ColumnLayout {
                spacing: 16
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32

                Text {
                    text: "MythKeyboard Shortcut Labels"
                    color: MythColors.cyan
                    font: MythTypography.label
                }

                MythCard {
                    Layout.fillWidth: true

                    Flow {
                        width: parent.width
                        spacing: 10

                        Repeater {
                            model: ["K", "P", "T", "N", "S", "Q"]
                            Rectangle {
                                width: labelRow.width + 20
                                height: 26
                                radius: 6
                                color: Qt.rgba(0, 229/255, 255/255, 0.06)
                                border.color: MythColors.borderSubtle

                                RowLayout {
                                    id: labelRow
                                    anchors.centerIn: parent
                                    spacing: 6

                                    Text { text: "⌘"; font.family: "JetBrains Mono"; font.pixelSize: 11; color: MythColors.cyan }
                                    Text { text: modelData; font.family: "JetBrains Mono"; font.pixelSize: 11; color: MythColors.text2 }
                                }
                            }
                        }
                    }
                }
            }
            
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 32 // Margin bottom
            }
        }
    }
}
