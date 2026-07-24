import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    property var spacings: [2, 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80, 96, 128]
    property var radii: [
        { name: "XS", val: "4px", px: 4, token: "radius.xs" },
        { name: "Small", val: "8px", px: 8, token: "radius.sm" },
        { name: "Medium", val: "12px", px: 12, token: "radius.md" },
        { name: "Large", val: "16px", px: 16, token: "radius.lg" },
        { name: "XL", val: "24px", px: 24, token: "radius.xl" },
        { name: "Window", val: "28px", px: 28, token: "radius.window" },
        { name: "Pill", val: "999px", px: 999, token: "radius.pill" }
    ]
    property var shadowsList: [
        { name: "Elevation 0", desc: "No shadow — base surfaces" },
        { name: "Elevation 1", desc: "Small floating element" },
        { name: "Elevation 2", desc: "Card and panel" },
        { name: "Elevation 3", desc: "Menu and dialog" },
        { name: "Elevation 4", desc: "Modal and critical overlay" }
    ]
    property var glows: [
        { name: "Cyan Glow SM", color: MythColors.cyan },
        { name: "Cyan Glow MD", color: MythColors.cyan },
        { name: "Purple Glow SM", color: MythColors.purple },
        { name: "Purple Glow MD", color: MythColors.purple },
        { name: "Error Glow SM", color: MythColors.error }
    ]
    property var motion: [
        { name: "Instant", val: "80ms", token: "motion.instant", use: "State toggle" },
        { name: "Fast", val: "150ms", token: "motion.fast", use: "Hover feedback" },
        { name: "Standard", val: "200ms", token: "motion.standard", use: "Menu, dialog" },
        { name: "Emphasized", val: "250ms", token: "motion.emphasized", use: "Window transition" },
        { name: "Slow", val: "350ms", token: "motion.slow", use: "Complex layout" }
    ]

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: root.width
            spacing: 24

            Item { height: 32; width: 1 }

            // PageHeader
            ColumnLayout {
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32
                spacing: 8

                RowLayout {
                    spacing: 8
                    Rectangle {
                        width: 24
                        height: 24
                        radius: 4
                        color: MythColors.cyan
                        Text {
                            anchors.centerIn: parent
                            text: "03"
                            color: "black"
                            font.bold: true
                            font.pixelSize: 12
                        }
                    }
                    Text {
                        text: "Design Tokens"
                        color: MythColors.cyan
                        font.pixelSize: MythTypography.label
                    }
                }

                Text {
                    text: "Design Tokens"
                    color: MythColors.text
                    font.pixelSize: MythTypography.h1
                }

                Text {
                    text: "All spacing, radius, shadow, glow, blur, and motion primitives."
                    color: MythColors.text2
                    font.pixelSize: MythTypography.body
                }
            }

            // SectionTag: Spacing Scale — 8px grid
            Text {
                Layout.leftMargin: 32
                Layout.topMargin: 24
                text: "Spacing Scale — 8px grid"
                color: MythColors.text2
                font.pixelSize: MythTypography.label
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32
                Layout.bottomMargin: 24
                color: MythColors.surface
                border.color: MythColors.borderSubtle
                border.width: 1
                radius: 12
                opacity: 0.8
                implicitHeight: spacingsLayout.implicitHeight + 64

                ColumnLayout {
                    id: spacingsLayout
                    anchors.centerIn: parent
                    width: parent.width - 64
                    spacing: 14

                    Repeater {
                        model: root.spacings
                        delegate: RowLayout {
                            Layout.fillWidth: true
                            spacing: 16

                            Text {
                                text: "spacing." + modelData
                                color: MythColors.cyan
                                font.family: "monospace"
                                font.pixelSize: 11
                                Layout.minimumWidth: 72
                            }

                            Rectangle {
                                height: 14
                                width: Math.min(modelData * 1.5, 240)
                                radius: 3
                                color: MythColors.cyan
                                opacity: 0.8
                            }

                            Text {
                                text: modelData + "px"
                                color: MythColors.text2
                                font.family: "monospace"
                                font.pixelSize: 10
                            }
                        }
                    }
                }
            }

            // SectionTag: Border Radius
            Text {
                Layout.leftMargin: 32
                text: "Border Radius"
                color: MythColors.text2
                font.pixelSize: MythTypography.label
            }

            Flow {
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32
                Layout.bottomMargin: 24
                spacing: 12

                Repeater {
                    model: root.radii
                    delegate: ColumnLayout {
                        spacing: 10
                        
                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter
                            width: 56
                            height: 56
                            color: MythColors.surface
                            border.color: MythColors.borderStrong
                            border.width: 1
                            radius: Math.min(modelData.px, 28)
                        }

                        ColumnLayout {
                            Layout.alignment: Qt.AlignHCenter
                            spacing: 2
                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: modelData.name
                                color: MythColors.text
                                font.pixelSize: 12
                                font.bold: true
                            }
                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: modelData.val
                                color: MythColors.cyan
                                font.family: "monospace"
                                font.pixelSize: 10
                            }
                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: modelData.token
                                color: MythColors.text2
                                font.family: "monospace"
                                font.pixelSize: 9
                            }
                        }
                    }
                }
            }

            GridLayout {
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32
                Layout.bottomMargin: 24
                columns: root.width > 800 ? 2 : 1
                columnSpacing: 32
                rowSpacing: 32

                // Column 1: Elevation & Shadow
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop
                    spacing: 16

                    Text {
                        text: "Elevation & Shadow"
                        color: MythColors.text2
                        font.pixelSize: MythTypography.label
                    }

                    Repeater {
                        model: root.shadowsList
                        delegate: Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: 48
                            color: MythColors.surface
                            border.color: MythColors.borderSubtle
                            border.width: 1
                            radius: 10

                            ColumnLayout {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 16
                                anchors.right: parent.right
                                anchors.rightMargin: 16
                                spacing: 2

                                Text {
                                    Layout.fillWidth: true
                                    text: modelData.name
                                    color: MythColors.text
                                    font.pixelSize: 13
                                    font.bold: true
                                }
                                Text {
                                    Layout.fillWidth: true
                                    text: modelData.desc
                                    color: MythColors.text2
                                    font.pixelSize: 11
                                }
                            }
                        }
                    }
                }

                // Column 2: Glow System
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop
                    spacing: 16

                    Text {
                        text: "Glow System"
                        color: MythColors.text2
                        font.pixelSize: MythTypography.label
                    }

                    Repeater {
                        model: root.glows
                        delegate: Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: 48
                            color: MythColors.voidElevated
                            radius: 10
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 10
                                color: "transparent"
                                border.color: modelData.color
                                border.width: 1
                                opacity: 0.3
                            }

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                anchors.topMargin: 12
                                anchors.bottomMargin: 12
                                spacing: 14

                                Rectangle {
                                    width: 8
                                    height: 8
                                    radius: 4
                                    color: modelData.color
                                }

                                Text {
                                    Layout.fillWidth: true
                                    text: modelData.name
                                    color: MythColors.text
                                    font.pixelSize: 13
                                    font.bold: true
                                }

                                Rectangle {
                                    width: badgeText.implicitWidth + 16
                                    height: 24
                                    radius: 12
                                    color: "transparent"
                                    
                                    Rectangle {
                                        anchors.fill: parent
                                        radius: 12
                                        color: modelData.color
                                        opacity: 0.1
                                    }
                                    
                                    Rectangle {
                                        anchors.fill: parent
                                        radius: 12
                                        color: "transparent"
                                        border.color: modelData.color
                                        border.width: 1
                                        opacity: 0.2
                                    }
                                    
                                    Text {
                                        id: badgeText
                                        anchors.centerIn: parent
                                        text: modelData.color.toString()
                                        color: modelData.color
                                        font.pixelSize: 10
                                        font.bold: true
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // SectionTag: Motion Tokens
            Text {
                Layout.leftMargin: 32
                text: "Motion Tokens"
                color: MythColors.text2
                font.pixelSize: MythTypography.label
            }

            Flow {
                Layout.fillWidth: true
                Layout.leftMargin: 32
                Layout.rightMargin: 32
                spacing: 10

                Repeater {
                    model: root.motion
                    delegate: Rectangle {
                        width: Math.max(140, motionLayout.implicitWidth + 40)
                        implicitHeight: motionLayout.implicitHeight + 32
                        color: MythColors.surface
                        border.color: MythColors.borderSubtle
                        border.width: 1
                        radius: 12
                        opacity: 0.8

                        ColumnLayout {
                            id: motionLayout
                            anchors.fill: parent
                            anchors.margins: 16
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20
                            spacing: 4

                            Text {
                                text: modelData.name
                                color: MythColors.text
                                font.pixelSize: 14
                                font.bold: true
                                Layout.bottomMargin: 2
                            }
                            Text {
                                text: modelData.val
                                color: MythColors.cyan
                                font.family: "monospace"
                                font.pixelSize: 16
                                Layout.bottomMargin: 2
                            }
                            Text {
                                text: modelData.token
                                color: MythColors.text2
                                font.family: "monospace"
                                font.pixelSize: 10
                            }
                            Text {
                                text: modelData.use
                                color: MythColors.textMuted
                                font.pixelSize: 11
                            }
                        }
                    }
                }
            }
            
            Item { height: 48; width: 1 } // Bottom margin
        }
    }
}
