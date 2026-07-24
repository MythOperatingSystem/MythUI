import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 24

            // PageBadge
            RowLayout {
                spacing: 12
                Layout.topMargin: 40

                Rectangle {
                    width: 28
                    height: 28
                    radius: 6
                    color: Qt.rgba(MythColors.cyan.r, MythColors.cyan.g, MythColors.cyan.b, 0.1)
                    border.width: 1
                    border.color: Qt.rgba(MythColors.cyan.r, MythColors.cyan.g, MythColors.cyan.b, 0.2)
                    
                    Text {
                        anchors.centerIn: parent
                        text: "08"
                        color: MythColors.cyan
                        font.pixelSize: MythTypography.caption
                        font.bold: true
                    }
                }
                Text {
                    text: "Advanced Components"
                    color: MythColors.cyan
                    font.pixelSize: MythTypography.caption
                    font.letterSpacing: 1.2
                }
            }

            Text {
                text: "Advanced Components"
                font.pixelSize: MythTypography.h1
                color: MythColors.text
                Layout.fillWidth: true
            }

            Text {
                text: "MythWindow, MythSidebar, MythTable, and MythChart."
                font.pixelSize: MythTypography.body
                color: MythColors.textMuted
                Layout.fillWidth: true
                Layout.bottomMargin: 16
            }

            // SectionTag: MythWindow — Standard
            Text {
                text: "MythWindow — Standard"
                font.pixelSize: MythTypography.caption
                color: MythColors.text2
                Layout.fillWidth: true
                Layout.topMargin: 16
                font.letterSpacing: 1.0
            }

            MythCard {
                Layout.fillWidth: true
                implicitHeight: 220
                padding: 0
                clip: true

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    // Title Bar
                    Rectangle {
                        Layout.fillWidth: true
                        height: 46
                        color: Qt.rgba(1, 1, 1, 0.02)
                        
                        Rectangle {
                            width: parent.width
                            height: 1
                            anchors.bottom: parent.bottom
                            color: MythColors.borderSubtle
                        }

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 18
                            anchors.rightMargin: 18
                            spacing: 10

                            RowLayout {
                                spacing: 6
                                Rectangle { width: 9; height: 9; radius: 4.5; color: MythColors.error; opacity: 0.8 }
                                Rectangle { width: 9; height: 9; radius: 4.5; color: MythColors.warning; opacity: 0.8 }
                                Rectangle { width: 9; height: 9; radius: 4.5; color: MythColors.success; opacity: 0.8 }
                            }

                            Rectangle {
                                width: 24
                                height: 24
                                radius: 6
                                color: MythColors.surface
                                Text {
                                    anchors.centerIn: parent
                                    text: ">_"
                                    color: MythColors.cyan
                                    font.pixelSize: 12
                                    font.family: "JetBrains Mono"
                                }
                            }

                            Text {
                                Layout.fillWidth: true
                                horizontalAlignment: Text.AlignHCenter
                                text: "Myth Terminal — zsh"
                                font.pixelSize: 13
                                font.weight: Font.Medium
                                color: MythColors.text2
                            }

                            Text {
                                text: "80×24"
                                font.family: "JetBrains Mono"
                                font.pixelSize: 10
                                color: MythColors.textMuted
                            }
                        }
                    }

                    // Terminal content
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 24
                            anchors.topMargin: 20
                            spacing: 4

                            RowLayout {
                                spacing: 4
                                Text { text: "myth@workstation ~ $"; color: MythColors.cyan; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                                Text { text: "git status"; color: MythColors.text; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                            }
                            RowLayout {
                                spacing: 4
                                Text { text: "On branch"; color: MythColors.text2; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                                Text { text: "main"; color: MythColors.cyan; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                            }
                            Text {
                                text: "  3 files changed, 47 insertions(+), 12 deletions(-)"
                                color: MythColors.success
                                font.family: "JetBrains Mono"
                                font.pixelSize: 13
                            }
                            RowLayout {
                                spacing: 4
                                Text { text: "myth@workstation ~ $"; color: MythColors.cyan; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                                Text { text: "_"; color: MythColors.text; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                            }
                            Item { Layout.fillHeight: true } 
                        }
                    }

                    // Bottom Bar
                    Rectangle {
                        Layout.fillWidth: true
                        height: 32
                        color: Qt.rgba(1, 1, 1, 0.01)
                        
                        Rectangle {
                            width: parent.width
                            height: 1
                            anchors.top: parent.top
                            color: MythColors.borderSubtle
                        }

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 18
                            anchors.rightMargin: 18
                            Text {
                                text: "INSERT"
                                font.family: "JetBrains Mono"
                                font.pixelSize: 10
                                color: MythColors.textMuted
                            }
                            Item { Layout.fillWidth: true }
                            Text {
                                text: "UTF-8 — zsh — main"
                                font.family: "JetBrains Mono"
                                font.pixelSize: 10
                                color: MythColors.textMuted
                            }
                        }
                    }
                }
            }

            // SectionTag: MythTable — System Processes
            Text {
                text: "MythTable — System Processes"
                font.pixelSize: MythTypography.caption
                color: MythColors.text2
                Layout.fillWidth: true
                Layout.topMargin: 24
                font.letterSpacing: 1.0
            }

            MythCard {
                Layout.fillWidth: true
                padding: 0
                clip: true

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    // Headers
                    Rectangle {
                        Layout.fillWidth: true
                        height: 36
                        color: Qt.rgba(1, 1, 1, 0.03)
                        
                        Rectangle { width: parent.width; height: 1; anchors.bottom: parent.bottom; color: MythColors.borderStrong }

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 16

                            Text { Layout.fillWidth: true; text: "PROCESS"; font.family: "JetBrains Mono"; font.pixelSize: 10; font.letterSpacing: 0.8; color: MythColors.text2 }
                            Text { Layout.preferredWidth: 60; text: "CPU"; font.family: "JetBrains Mono"; font.pixelSize: 10; font.letterSpacing: 0.8; color: MythColors.text2 }
                            Text { Layout.preferredWidth: 80; text: "MEMORY"; font.family: "JetBrains Mono"; font.pixelSize: 10; font.letterSpacing: 0.8; color: MythColors.text2 }
                            Text { Layout.preferredWidth: 80; text: "PID"; font.family: "JetBrains Mono"; font.pixelSize: 10; font.letterSpacing: 0.8; color: MythColors.text2 }
                            Text { Layout.preferredWidth: 80; text: "STATUS"; font.family: "JetBrains Mono"; font.pixelSize: 10; font.letterSpacing: 0.8; color: MythColors.text2 }
                        }
                    }

                    Repeater {
                        model: ListModel {
                            ListElement { name: "myth-ai-daemon"; cpu: "12.4%"; mem: "312 MB"; pid: "1842"; status: "running" }
                            ListElement { name: "kernel-thread"; cpu: "4.1%"; mem: "8 MB"; pid: "1"; status: "running" }
                            ListElement { name: "myth-compositor"; cpu: "8.7%"; mem: "248 MB"; pid: "2104"; status: "running" }
                            ListElement { name: "myth-store"; cpu: "0.2%"; mem: "64 MB"; pid: "3891"; status: "sleeping" }
                            ListElement { name: "myth-update"; cpu: "0.0%"; mem: "20 MB"; pid: "4102"; status: "idle" }
                        }
                        delegate: Rectangle {
                            width: parent.width
                            height: 40
                            color: index % 2 === 0 ? "transparent" : Qt.rgba(1, 1, 1, 0.01)
                            
                            Rectangle { width: parent.width; height: 1; anchors.bottom: parent.bottom; color: MythColors.borderSubtle; visible: index !== 4 }

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                spacing: 16

                                Text { Layout.fillWidth: true; text: model.name; font.family: "JetBrains Mono"; font.pixelSize: 12; color: MythColors.text }
                                Text { Layout.preferredWidth: 60; text: model.cpu; font.family: "JetBrains Mono"; font.pixelSize: 12; color: parseFloat(model.cpu) > 10 ? MythColors.warning : MythColors.text2 }
                                Text { Layout.preferredWidth: 80; text: model.mem; font.family: "JetBrains Mono"; font.pixelSize: 12; color: MythColors.text2 }
                                Text { Layout.preferredWidth: 80; text: model.pid; font.family: "JetBrains Mono"; font.pixelSize: 12; color: MythColors.textMuted }
                                
                                Rectangle {
                                    Layout.preferredWidth: 80
                                    height: 22
                                    radius: 11
                                    color: Qt.rgba(statusColor(model.status).r, statusColor(model.status).g, statusColor(model.status).b, 0.15)
                                    
                                    Text {
                                        anchors.centerIn: parent
                                        text: model.status
                                        font.family: "JetBrains Mono"
                                        font.pixelSize: 10
                                        color: statusColor(model.status)
                                    }
                                    
                                    function statusColor(s) {
                                        if (s === "running") return MythColors.success;
                                        if (s === "sleeping") return MythColors.cyan;
                                        return MythColors.textMuted;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // SectionTag: MythChart — System Monitor
            Text {
                text: "MythChart — System Monitor"
                font.pixelSize: MythTypography.caption
                color: MythColors.text2
                Layout.fillWidth: true
                Layout.topMargin: 24
                font.letterSpacing: 1.0
            }

            GridLayout {
                Layout.fillWidth: true
                columns: 2
                rowSpacing: 16
                columnSpacing: 16

                Repeater {
                    model: ListModel {
                        ListElement { label: "CPU"; val: 34; itemColor: "cyan" }
                        ListElement { label: "GPU"; val: 22; itemColor: "purple" }
                        ListElement { label: "Memory"; val: 61; itemColor: "warning" }
                        ListElement { label: "Storage"; val: 78; itemColor: "success" }
                    }
                    delegate: MythCard {
                        Layout.fillWidth: true
                        implicitHeight: 140
                        padding: 24
                        
                        property color chartColor: {
                            if (model.itemColor === "cyan") return MythColors.cyan;
                            if (model.itemColor === "purple") return MythColors.purple;
                            if (model.itemColor === "warning") return MythColors.warning;
                            return MythColors.success;
                        }

                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 12

                            RowLayout {
                                Layout.fillWidth: true
                                Text { text: model.label; font.pixelSize: 13; font.weight: Font.DemiBold; color: MythColors.text; Layout.fillWidth: true }
                                Text { text: model.val + "%"; font.family: "JetBrains Mono"; font.pixelSize: 14; font.weight: Font.DemiBold; color: chartColor }
                            }

                            Item {
                                Layout.fillWidth: true
                                height: 40
                                
                                Shape {
                                    anchors.fill: parent
                                    ShapePath {
                                        strokeWidth: 1.5
                                        strokeColor: chartColor
                                        fillColor: "transparent"
                                        startX: 0
                                        startY: 40 - model.val * 0.4
                                        PathCubic { x: 60; y: 40 - (model.val + 2) * 0.4; control1X: 20; control1Y: 40 - (model.val + 5) * 0.4; control2X: 40; control2Y: 40 - (model.val - 8) * 0.4 }
                                        PathCubic { x: 130; y: 40 - (model.val + 6) * 0.4; control1X: 80; control1Y: 40 - (model.val + 12) * 0.4; control2X: 100; control2Y: 40 - (model.val - 4) * 0.4 }
                                        PathCubic { x: 200; y: 40 - model.val * 0.4; control1X: 160; control1Y: 40 - (model.val + 16) * 0.4; control2X: 170; control2Y: 40 - (model.val - 2) * 0.4 }
                                    }
                                    
                                    ShapePath {
                                        strokeWidth: 0
                                        fillGradient: LinearGradient {
                                            y1: 0; y2: 40
                                            GradientStop { position: 0.0; color: Qt.rgba(chartColor.r, chartColor.g, chartColor.b, 0.3) }
                                            GradientStop { position: 1.0; color: Qt.rgba(chartColor.r, chartColor.g, chartColor.b, 0.0) }
                                        }
                                        startX: 0
                                        startY: 40 - model.val * 0.4
                                        PathCubic { x: 60; y: 40 - (model.val + 2) * 0.4; control1X: 20; control1Y: 40 - (model.val + 5) * 0.4; control2X: 40; control2Y: 40 - (model.val - 8) * 0.4 }
                                        PathCubic { x: 130; y: 40 - (model.val + 6) * 0.4; control1X: 80; control1Y: 40 - (model.val + 12) * 0.4; control2X: 100; control2Y: 40 - (model.val - 4) * 0.4 }
                                        PathCubic { x: 200; y: 40 - model.val * 0.4; control1X: 160; control1Y: 40 - (model.val + 16) * 0.4; control2X: 170; control2Y: 40 - (model.val - 2) * 0.4 }
                                        PathLine { x: 200; y: 40 }
                                        PathLine { x: 0; y: 40 }
                                    }
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 4
                                radius: 2
                                color: Qt.rgba(1, 1, 1, 0.06)
                                Rectangle {
                                    width: parent.width * (model.val / 100.0)
                                    height: parent.height
                                    radius: 2
                                    color: chartColor
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
