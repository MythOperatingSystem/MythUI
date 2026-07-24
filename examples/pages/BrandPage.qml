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

        ColumnLayout {
            width: parent.width - 64
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 24

            Item { height: 32 } // Top padding

            // Page Badge
            RowLayout {
                spacing: 8
                Rectangle {
                    width: 24
                    height: 24
                    radius: 4
                    color: MythColors.voidElevated ? MythColors.voidElevated : "#12141D"
                    border.color: MythColors.borderSubtle
                    Text {
                        anchors.centerIn: parent
                        text: "02"
                        color: MythColors.cyan
                        font.family: MythTypography.codeFont
                    }
                }
                Text {
                    text: "Brand"
                    color: MythColors.cyan
                    font.pixelSize: MythTypography.label
                }
            }

            // PageH1
            Text {
                text: "Brand System"
                color: MythColors.textPrimary
                font.pixelSize: MythTypography.h1
            }

            // PageSub
            Text {
                text: "Identity, color palette, and brand applications for MythOS."
                color: MythColors.textSecondary
                font.pixelSize: MythTypography.body
                Layout.maximumWidth: 600
                wrapMode: Text.WordWrap
            }

            Item { height: 24 }

            // SectionTag: Logo System
            Text {
                text: "LOGO SYSTEM"
                color: MythColors.textMuted
                font.family: MythTypography.codeFont
            }

            GridLayout {
                columns: 4
                rowSpacing: 12
                columnSpacing: 12
                Layout.fillWidth: true
                Layout.bottomMargin: 64

                // Primary Lockup
                Rectangle {
                    Layout.fillWidth: true
                    height: 120
                    color: MythColors.surface ? MythColors.surface : "#171A24"
                    border.color: MythColors.borderSubtle
                    radius: 12
                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 16
                        Text { 
                            text: "MythOS"
                            color: MythColors.textPrimary
                            font.bold: true
                            font.pixelSize: 24
                            Layout.alignment: Qt.AlignHCenter 
                        } 
                        Text { 
                            text: "Primary Lockup"
                            color: MythColors.textSecondary
                            font.pixelSize: MythTypography.monoSmall
                            Layout.alignment: Qt.AlignHCenter 
                        }
                    }
                }

                // Symbol Only
                Rectangle {
                    Layout.fillWidth: true
                    height: 120
                    color: MythColors.surface ? MythColors.surface : "#171A24"
                    border.color: MythColors.borderSubtle
                    radius: 12
                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 16
                        Text { 
                            text: "M"
                            color: MythColors.cyan
                            font.bold: true
                            font.pixelSize: 32
                            Layout.alignment: Qt.AlignHCenter 
                        } 
                        Text { 
                            text: "Symbol Only"
                            color: MythColors.textSecondary
                            font.pixelSize: MythTypography.monoSmall
                            Layout.alignment: Qt.AlignHCenter 
                        }
                    }
                }

                // Compact
                Rectangle {
                    Layout.fillWidth: true
                    height: 120
                    color: MythColors.surface ? MythColors.surface : "#171A24"
                    border.color: MythColors.borderSubtle
                    radius: 12
                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 16
                        Text { 
                            text: "MythOS"
                            color: MythColors.textPrimary
                            font.bold: true
                            font.pixelSize: 16
                            Layout.alignment: Qt.AlignHCenter 
                        } 
                        Text { 
                            text: "Compact"
                            color: MythColors.textSecondary
                            font.pixelSize: MythTypography.monoSmall
                            Layout.alignment: Qt.AlignHCenter 
                        }
                    }
                }

                // Small Scale
                Rectangle {
                    Layout.fillWidth: true
                    height: 120
                    color: MythColors.surface ? MythColors.surface : "#171A24"
                    border.color: MythColors.borderSubtle
                    radius: 12
                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 16
                        RowLayout {
                            spacing: 12
                            Layout.alignment: Qt.AlignHCenter
                            Text { text: "M"; color: MythColors.cyan; font.pixelSize: 12 }
                            Text { text: "M"; color: MythColors.cyan; font.pixelSize: 16 }
                            Text { text: "M"; color: MythColors.cyan; font.pixelSize: 20 }
                            Text { text: "M"; color: MythColors.cyan; font.pixelSize: 24 }
                        }
                        Text { 
                            text: "Small Scale"
                            color: MythColors.textSecondary
                            font.pixelSize: MythTypography.monoSmall
                            Layout.alignment: Qt.AlignHCenter 
                        }
                    }
                }
            }

            // SectionTag: Color Palette
            Text {
                text: "COLOR PALETTE"
                color: MythColors.textMuted
                font.family: MythTypography.codeFont
            }

            GridLayout {
                columns: 4
                rowSpacing: 20
                columnSpacing: 10
                Layout.fillWidth: true
                Layout.bottomMargin: 20

                Repeater {
                    model: [
                        { name: "Void Black", hex: "#0D0E15", token: "color.bg.base", role: "Page background" },
                        { name: "Void Elevated", hex: "#12141D", token: "color.bg.elevated", role: "Panel background" },
                        { name: "Void Surface", hex: "#171A24", token: "color.bg.surface", role: "Card background" },
                        { name: "Myth Cyan", hex: "#00E5FF", token: "color.accent.primary", role: "Primary accent" },
                        { name: "Myth Purple", hex: "#8B5CFF", token: "color.accent.ai", role: "AI accent" },
                        { name: "Text Primary", hex: "#F5F7FF", token: "color.text.primary", role: "Main text" },
                        { name: "Text Secondary", hex: "#9CA3AF", token: "color.text.secondary", role: "Supporting text" },
                        { name: "Text Muted", hex: "#697181", token: "color.text.muted", role: "Metadata, labels" }
                    ]
                    delegate: ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 2
                        Rectangle {
                            Layout.fillWidth: true
                            height: 64
                            radius: 12
                            color: modelData.hex
                            border.color: (modelData.hex === "#0D0E15" || modelData.hex === "#12141D" || modelData.hex === "#171A24") ? MythColors.borderSubtle : "transparent"
                            border.width: (modelData.hex === "#0D0E15" || modelData.hex === "#12141D" || modelData.hex === "#171A24") ? 1 : 0
                            Layout.bottomMargin: 8
                        }
                        Text { text: modelData.name; color: MythColors.textPrimary; font.bold: true; font.pixelSize: 13 }
                        Text { text: modelData.hex; color: MythColors.cyan; font.pixelSize: MythTypography.monoSmall }
                        Text { text: modelData.token; color: MythColors.textSecondary; font.pixelSize: MythTypography.monoSmall }
                        Text { text: modelData.role; color: MythColors.textMuted; font.pixelSize: 11; Layout.topMargin: 1 }
                    }
                }
            }

            GridLayout {
                columns: 3
                rowSpacing: 10
                columnSpacing: 10
                Layout.fillWidth: true
                Layout.bottomMargin: 64

                Repeater {
                    model: [
                        { name: "Success", hex: MythColors.success ? MythColors.success : "#10B981", token: "color.semantic.success" },
                        { name: "Warning", hex: MythColors.warning ? MythColors.warning : "#F59E0B", token: "color.semantic.warning" },
                        { name: "Error", hex: MythColors.error ? MythColors.error : "#EF4444", token: "color.semantic.error" }
                    ]
                    delegate: Rectangle {
                        Layout.fillWidth: true
                        height: 60
                        color: MythColors.surface ? MythColors.surface : "#171A24"
                        border.color: MythColors.borderSubtle
                        radius: 12
                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 14
                            spacing: 14
                            Rectangle {
                                width: 32; height: 32
                                radius: 8
                                color: modelData.hex
                                Layout.alignment: Qt.AlignVCenter
                            }
                            ColumnLayout {
                                spacing: 2
                                Layout.alignment: Qt.AlignVCenter
                                Text { text: modelData.name; color: MythColors.textPrimary; font.bold: true; font.pixelSize: 13 }
                                Text { text: modelData.hex; color: modelData.hex; font.pixelSize: MythTypography.monoSmall }
                                Text { text: modelData.token; color: MythColors.textSecondary; font.pixelSize: MythTypography.monoSmall }
                            }
                        }
                    }
                }
            }

            // SectionTag: Brand Applications
            Text {
                text: "BRAND APPLICATIONS"
                color: MythColors.textMuted
                font.family: MythTypography.codeFont
            }

            GridLayout {
                columns: 4
                rowSpacing: 12
                columnSpacing: 12
                Layout.fillWidth: true

                Repeater {
                    model: [
                        { label: "Boot Logo", bg: "#000000" },
                        { label: "Login Logo", bg: MythColors.voidElevated ? MythColors.voidElevated : "#12141D" },
                        { label: "App Icon", bg: MythColors.surface ? MythColors.surface : "#171A24" },
                        { label: "Repo Avatar", bg: MythColors.surface ? MythColors.surface : "#171A24" }
                    ]
                    delegate: Rectangle {
                        Layout.fillWidth: true
                        height: 140
                        color: MythColors.surface ? MythColors.surface : "#171A24"
                        border.color: MythColors.borderSubtle
                        radius: 12
                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 12
                            Rectangle {
                                width: 64; height: 64
                                radius: 14
                                color: modelData.bg
                                border.color: MythColors.borderSubtle
                                border.width: 1
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    anchors.centerIn: parent
                                    text: "M"
                                    color: MythColors.cyan
                                    font.bold: true
                                    font.pixelSize: 24
                                }
                            }
                            Text {
                                text: modelData.label
                                color: MythColors.textSecondary
                                font.pixelSize: MythTypography.monoSmall
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }
                }
            }

            Item { height: 64 } // Bottom padding
        }
    }
}
