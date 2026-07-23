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
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        ColumnLayout {
            width: parent.width
            spacing: 24

            Item { Layout.preferredHeight: 16 } // Top padding

            // Page Badge
            RowLayout {
                Layout.leftMargin: 40
                spacing: 8
                
                Rectangle {
                    color: "transparent"
                    border.color: MythColors.mythCyan
                    border.width: 1
                    radius: 4
                    implicitWidth: badgeNum.implicitWidth + 12
                    implicitHeight: badgeNum.implicitHeight + 6
                    Rectangle {
                        anchors.fill: parent
                        color: MythColors.mythCyan
                        opacity: 0.1
                        radius: 4
                    }
                    Text {
                        id: badgeNum
                        anchors.centerIn: parent
                        text: "32"
                        color: MythColors.mythCyan
                        font.family: MythTypography.monospaceFont
                        font.pixelSize: 10
                    }
                }
                
                Text {
                    text: "DEVELOPER HANDOFF"
                    color: MythColors.textSecondary
                    font.family: MythTypography.monospaceFont
                    font.pixelSize: 10
                    font.letterSpacing: 1.2
                }
            }

            // Page H1
            Text {
                Layout.leftMargin: 40
                text: "Developer Handoff"
                color: MythColors.textPrimary
                font.family: MythTypography.sansFont
                font.pixelSize: 32
                font.weight: Font.Bold
            }

            // Page Sub
            Text {
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.fillWidth: true
                Layout.maximumWidth: root.width - 80
                text: "Qt 6 / QML implementation reference — tokens, anatomy, component mappings."
                color: MythColors.textSecondary
                font.family: MythTypography.sansFont
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }

            Item { Layout.preferredHeight: 24 }

            // Section Tag 1
            Text {
                Layout.leftMargin: 40
                text: "COMPONENT REGISTRY"
                color: MythColors.textSecondary
                font.family: MythTypography.monospaceFont
                font.pixelSize: 10
                font.letterSpacing: 1.2
            }

            // Component Registry Table
            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                implicitHeight: registryLayout.implicitHeight
                color: "transparent"
                border.color: MythColors.borderStrong
                border.width: 1
                radius: 8
                clip: true

                Rectangle {
                    anchors.fill: parent
                    color: "white"
                    opacity: 0.03
                }

                ColumnLayout {
                    id: registryLayout
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 0

                    // Header
                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: 36
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.03)
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 0
                            
                            Text { Layout.preferredWidth: parent.width * 0.28; text: "COMPONENT"; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 10; font.letterSpacing: 0.8 }
                            Text { Layout.preferredWidth: parent.width * 0.14; text: "QML FILE"; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 10; font.letterSpacing: 0.8 }
                            Text { Layout.preferredWidth: parent.width * 0.14; text: "RADIUS"; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 10; font.letterSpacing: 0.8 }
                            Text { Layout.preferredWidth: parent.width * 0.14; text: "HEIGHT"; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 10; font.letterSpacing: 0.8 }
                            Text { Layout.preferredWidth: parent.width * 0.30; text: "TOKENS"; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 10; font.letterSpacing: 0.8 }
                        }
                        
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: MythColors.borderStrong
                        }
                    }

                    // Data
                    Repeater {
                        model: [
                            { name: "Myth/Button/Primary", qml: "MythButton.qml", radius: "10px", height: "38px", tokens: ["color.accent.primary", "motion.fast"] },
                            { name: "Myth/Input/Search", qml: "MythInput.qml", radius: "10px", height: "40px", tokens: ["color.bg.surface", "color.accent.primary"] },
                            { name: "Myth/Card/Standard", qml: "MythCard.qml", radius: "16px", height: "auto", tokens: ["color.bg.surface", "blur.md"] },
                            { name: "Myth/Window/Standard", qml: "MythWindow.qml", radius: "28px", height: "auto", tokens: ["color.bg.elevated", "blur.lg"] },
                            { name: "Myth/Dialog/Permission", qml: "MythDialog.qml", radius: "20px", height: "auto", tokens: ["color.accent.ai", "elevation.4"] },
                            { name: "Myth/Notification/AI", qml: "MythNotification.qml", radius: "14px", height: "auto", tokens: ["color.accent.ai", "motion.standard"] }
                        ]
                        
                        Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: 44
                            color: index % 2 === 0 ? "transparent" : Qt.rgba(255/255, 255/255, 255/255, 0.01)

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                spacing: 0
                                
                                Text { Layout.preferredWidth: parent.width * 0.28; text: modelData.name; color: MythColors.mythCyan; font.family: MythTypography.monospaceFont; font.pixelSize: 11 }
                                Text { Layout.preferredWidth: parent.width * 0.14; text: modelData.qml; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 11 }
                                Text { Layout.preferredWidth: parent.width * 0.14; text: modelData.radius; color: MythColors.textPrimary; font.family: MythTypography.monospaceFont; font.pixelSize: 11 }
                                Text { Layout.preferredWidth: parent.width * 0.14; text: modelData.height; color: MythColors.textPrimary; font.family: MythTypography.monospaceFont; font.pixelSize: 11 }
                                
                                RowLayout { 
                                    Layout.preferredWidth: parent.width * 0.30
                                    spacing: 6
                                    
                                    Repeater {
                                        model: modelData.tokens
                                        Rectangle {
                                            color: "transparent"
                                            radius: 4
                                            implicitWidth: tText.implicitWidth + 12
                                            implicitHeight: tText.implicitHeight + 8
                                            Rectangle {
                                                anchors.fill: parent
                                                color: MythColors.mythPurple
                                                opacity: 0.15
                                                radius: 4
                                            }
                                            Text { id: tText; text: modelData; color: MythColors.mythPurple; anchors.centerIn: parent; font.family: MythTypography.monospaceFont; font.pixelSize: 9 }
                                        }
                                    }
                                }
                            }
                            
                            Rectangle {
                                anchors.bottom: parent.bottom
                                width: parent.width
                                height: 1
                                color: MythColors.borderSubtle
                                visible: index !== 5
                            }
                        }
                    }
                }
            }

            Item { Layout.preferredHeight: 16 }

            // Section Tag 2
            Text {
                Layout.leftMargin: 40
                text: "DESIGN → QML TOKEN TABLE"
                color: MythColors.textSecondary
                font.family: MythTypography.monospaceFont
                font.pixelSize: 10
                font.letterSpacing: 1.2
            }

            // Token Table
            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.bottomMargin: 64
                implicitHeight: tokenLayout.implicitHeight
                color: "transparent"
                border.color: MythColors.borderStrong
                border.width: 1
                radius: 8
                clip: true

                Rectangle {
                    anchors.fill: parent
                    color: "white"
                    opacity: 0.03
                }

                ColumnLayout {
                    id: tokenLayout
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 0

                    // Header
                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: 36
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.03)
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 0
                            
                            Text { Layout.preferredWidth: parent.width * 0.4; text: "DESIGN TOKEN"; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 10; font.letterSpacing: 0.8 }
                            Text { Layout.preferredWidth: parent.width * 0.4; text: "QML PROPERTY"; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 10; font.letterSpacing: 0.8 }
                            Text { Layout.preferredWidth: parent.width * 0.2; text: "VALUE"; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 10; font.letterSpacing: 0.8 }
                        }
                        
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: MythColors.borderStrong
                        }
                    }

                    // Data
                    Repeater {
                        model: [
                            { design: "color.bg.base", qml: "MythTheme.void", css: "#0D0E15" },
                            { design: "color.accent.primary", qml: "MythTheme.cyan", css: "#00E5FF" },
                            { design: "color.accent.ai", qml: "MythTheme.purple", css: "#8B5CFF" },
                            { design: "color.text.primary", qml: "MythTheme.textPrimary", css: "#F5F7FF" },
                            { design: "motion.fast", qml: "MythTheme.durationFast", css: "150ms" },
                            { design: "motion.standard", qml: "MythTheme.durationStandard", css: "200ms" },
                            { design: "radius.window", qml: "MythTheme.radiusWindow", css: "28px" },
                            { design: "blur.md", qml: "MythTheme.blurMedium", css: "20px" }
                        ]
                        
                        Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: 40
                            color: index % 2 === 0 ? "transparent" : Qt.rgba(255/255, 255/255, 255/255, 0.01)

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                spacing: 0
                                
                                Text { Layout.preferredWidth: parent.width * 0.4; text: modelData.design; color: MythColors.mythCyan; font.family: MythTypography.monospaceFont; font.pixelSize: 11 }
                                Text { Layout.preferredWidth: parent.width * 0.4; text: modelData.qml; color: MythColors.mythPurple; font.family: MythTypography.monospaceFont; font.pixelSize: 11 }
                                Text { Layout.preferredWidth: parent.width * 0.2; text: modelData.css; color: MythColors.textSecondary; font.family: MythTypography.monospaceFont; font.pixelSize: 11 }
                            }
                            
                            Rectangle {
                                anchors.bottom: parent.bottom
                                width: parent.width
                                height: 1
                                color: MythColors.borderSubtle
                                visible: index !== 7
                            }
                        }
                    }
                }
            }
        }
    }
}
