import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    anchors.fill: parent

    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth
        clip: true

        ColumnLayout {
            width: parent.width - 64
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 32
            anchors.topMargin: 48
            anchors.bottomMargin: 48
            spacing: 24

            // PageBadge equivalent
            RowLayout {
                spacing: 8
                
                Rectangle {
                    width: 24
                    height: 24
                    radius: 4
                    color: "transparent"
                    border.color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.3)
                    border.width: 1
                    
                    Text {
                        anchors.centerIn: parent
                        text: "01"
                        color: MythColors.mythCyan
                        font.family: MythTypography.codeFont
                        font.pixelSize: 10
                    }
                }
                
                Text {
                    text: "PRODUCT PRINCIPLES"
                    color: MythColors.mythCyan
                    font.family: MythTypography.uiFont
                    font.pixelSize: 12
                    font.weight: 600
                    font.capitalization: Font.AllUppercase
                    font.letterSpacing: 1.0
                }
            }

            Text {
                text: "Product Principles"
                color: MythColors.textPrimary
                font.family: MythTypography.uiFont
                font.pixelSize: 32
                font.weight: Font.Bold
            }

            Text {
                text: "Ten principles that define every decision in MythOS design."
                color: MythColors.textSecondary
                font.family: MythTypography.uiFont
                font.pixelSize: 16
                Layout.bottomMargin: 16
            }

            GridLayout {
                columns: 2
                columnSpacing: 16
                rowSpacing: 16
                Layout.fillWidth: true

                Repeater {
                    model: ListModel {
                        ListElement { title: "Quality Over Quantity"; desc: "Every feature must solve a real problem and match the MythOS identity."; correct: "Focused, purposeful actions that guide the user."; wrong: "Feature-bloated menus full of rarely-used options." }
                        ListElement { title: "Black First"; desc: "The void black foundation anchors the entire visual language."; correct: "Consistent dark surfaces with subtle elevation."; wrong: "Light-mode design adapted to dark with poor contrast." }
                        ListElement { title: "Glow is Information"; desc: "Glow communicates system state — active, AI, error, focus — never decoration."; correct: "Subtle cyan focus ring on the active control."; wrong: "Large decorative neon border on every card." }
                        ListElement { title: "Functional Motion"; desc: "Animation communicates change. It does not entertain."; correct: "200ms ease-out on menu open."; wrong: "1.5s cinematic scale-in animation on a tooltip." }
                        ListElement { title: "Performance Matters"; desc: "Blur, glow, and animation must respect real hardware constraints."; correct: "Blur applied only to floating layers above content."; wrong: "Full-screen dynamic background blur at 60fps." }
                        ListElement { title: "AI with User Control"; desc: "AI assists — it never acts without user awareness or consent."; correct: "AI suggests a command. User reviews. User confirms."; wrong: "AI automatically executes a terminal command." }
                        ListElement { title: "Privacy by Design"; desc: "Data stays local unless the user explicitly chooses otherwise."; correct: "Clear per-permission prompt with explanation and scope."; wrong: "Vague 'Allow access for a better experience' dialog." }
                        ListElement { title: "Developer First"; desc: "MythOS is built for the people who build everything else."; correct: "Terminal, code context, and AI commands at system level."; wrong: "Settings buried five layers deep in a consumer menu." }
                        ListElement { title: "Consistency Over Novelty"; desc: "Familiar interaction patterns are faster than clever new ones."; correct: "Standard keyboard shortcuts matching platform conventions."; wrong: "Custom gesture replacing the standard right-click menu." }
                        ListElement { title: "Accessibility by Default"; desc: "Every screen must be navigable by keyboard. Focus must always be visible."; correct: "Visible 2px cyan focus ring on all interactive elements."; wrong: "Focus state only shown on mouse hover." }
                    }

                    delegate: MythCard {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop
                        
                        implicitHeight: cardContent.implicitHeight + 56

                        ColumnLayout {
                            id: cardContent
                            anchors.fill: parent
                            anchors.margins: 28
                            spacing: 0

                            RowLayout {
                                spacing: 10
                                Layout.bottomMargin: 12
                                Text {
                                    text: (index < 9 ? "0" + (index + 1) : (index + 1).toString())
                                    color: MythColors.mythCyan
                                    opacity: 0.7
                                    font.family: MythTypography.codeFont
                                    font.pixelSize: 10
                                }
                                Text {
                                    text: model.title
                                    color: MythColors.textPrimary
                                    font.family: MythTypography.uiFont
                                    font.pixelSize: 14
                                    font.weight: 600
                                }
                            }

                            Text {
                                text: model.desc
                                color: MythColors.textSecondary
                                font.family: MythTypography.uiFont
                                font.pixelSize: 13
                                Layout.fillWidth: true
                                wrapMode: Text.WordWrap
                                lineHeight: 1.6
                                Layout.bottomMargin: 16
                            }

                            ColumnLayout {
                                spacing: 8
                                Layout.fillWidth: true

                                // Correct container
                                Rectangle {
                                    Layout.fillWidth: true
                                    implicitHeight: correctLayout.implicitHeight + 16
                                    color: MythColors.successSubtle
                                    border.color: Qt.rgba(MythColors.success.r, MythColors.success.g, MythColors.success.b, 0.19)
                                    border.width: 1
                                    radius: 8

                                    RowLayout {
                                        id: correctLayout
                                        anchors.fill: parent
                                        anchors.margins: 8
                                        anchors.leftMargin: 12
                                        anchors.rightMargin: 12
                                        spacing: 8
                                        alignment: Qt.AlignTop

                                        Text {
                                            text: "✓"
                                            color: MythColors.success
                                            font.family: MythTypography.uiFont
                                            font.pixelSize: 12
                                            Layout.alignment: Qt.AlignTop
                                            Layout.topMargin: 1
                                        }
                                        Text {
                                            text: model.correct
                                            color: MythColors.textSecondary
                                            font.family: MythTypography.uiFont
                                            font.pixelSize: 12
                                            lineHeight: 1.5
                                            wrapMode: Text.WordWrap
                                            Layout.fillWidth: true
                                        }
                                    }
                                }

                                // Wrong container
                                Rectangle {
                                    Layout.fillWidth: true
                                    implicitHeight: wrongLayout.implicitHeight + 16
                                    color: MythColors.errorSubtle
                                    border.color: Qt.rgba(MythColors.error.r, MythColors.error.g, MythColors.error.b, 0.19)
                                    border.width: 1
                                    radius: 8

                                    RowLayout {
                                        id: wrongLayout
                                        anchors.fill: parent
                                        anchors.margins: 8
                                        anchors.leftMargin: 12
                                        anchors.rightMargin: 12
                                        spacing: 8
                                        alignment: Qt.AlignTop

                                        Text {
                                            text: "✕"
                                            color: MythColors.error
                                            font.family: MythTypography.uiFont
                                            font.pixelSize: 12
                                            Layout.alignment: Qt.AlignTop
                                            Layout.topMargin: 1
                                        }
                                        Text {
                                            text: model.wrong
                                            color: MythColors.textSecondary
                                            font.family: MythTypography.uiFont
                                            font.pixelSize: 12
                                            lineHeight: 1.5
                                            wrapMode: Text.WordWrap
                                            Layout.fillWidth: true
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
