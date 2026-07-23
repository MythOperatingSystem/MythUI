import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    function getColor(ref) {
        if (ref === "cyan") return MythColors.mythCyan;
        if (ref === "purple") return MythColors.purple || "#A855F7";
        if (ref === "warning") return MythColors.warning;
        if (ref === "success") return MythColors.success;
        if (ref === "error") return MythColors.error;
        return MythColors.textPrimary;
    }

    Rectangle {
        anchors.fill: parent
        color: MythColors.voidBlack
    }

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: availableWidth
        
        Item {
            width: root.width
            implicitHeight: mainLayout.implicitHeight + 64
            
            ColumnLayout {
                id: mainLayout
                anchors.fill: parent
                anchors.margins: 32
                spacing: 32

                // Page Header
                ColumnLayout {
                    spacing: 8
                    Layout.fillWidth: true

                    // PageBadge
                    RowLayout {
                        spacing: 8
                        Item {
                            width: 24
                            height: 24
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 4
                                color: MythColors.mythCyan
                                opacity: 0.1
                            }
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 4
                                color: "transparent"
                                border.color: MythColors.mythCyan
                                opacity: 0.3
                            }

                            Text {
                                anchors.centerIn: parent
                                text: "21"
                                font.pixelSize: 11
                                font.weight: Font.Bold
                                color: MythColors.mythCyan
                            }
                        }
                        Text {
                            text: "Myth Hub"
                            font.pixelSize: 12
                            font.weight: Font.Bold
                            color: MythColors.mythCyan
                            font.capitalization: Font.AllUppercase
                            font.letterSpacing: 1
                        }
                    }

                    // PageH1
                    Text {
                        text: "Myth Hub"
                        font: MythTypography.h1
                        color: MythColors.textPrimary
                    }

                    // PageSub
                    Text {
                        text: "System dashboard — live metrics, processes, and alerts."
                        font: MythTypography.body
                        color: MythColors.textSecondary
                    }
                }

                // Metrics Grid
                GridLayout {
                    columns: 3
                    columnSpacing: 12
                    rowSpacing: 12
                    Layout.fillWidth: true

                    Repeater {
                        model: ListModel {
                            ListElement { label: "CPU"; val: 34; colorRef: "cyan"; unit: "%" }
                            ListElement { label: "GPU"; val: 22; colorRef: "purple"; unit: "%" }
                            ListElement { label: "Memory"; val: 61; colorRef: "warning"; unit: "%" }
                            ListElement { label: "Storage"; val: 78; colorRef: "success"; unit: "%" }
                            ListElement { label: "Network"; val: 312; colorRef: "cyan"; unit: "Mbps" }
                            ListElement { label: "Temp"; val: 54; colorRef: "error"; unit: "°C" }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: 140
                            color: "#0affffff"
                            border.color: MythColors.borderSubtle
                            radius: 8

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 20
                                spacing: 10

                                RowLayout {
                                    Layout.fillWidth: true
                                    Text {
                                        text: model.label
                                        font.pixelSize: 13
                                        color: MythColors.textSecondary
                                        Layout.fillWidth: true
                                    }
                                    Item {
                                        implicitWidth: unitText.implicitWidth + 12
                                        implicitHeight: unitText.implicitHeight + 6
                                        Rectangle {
                                            anchors.fill: parent
                                            radius: 4
                                            color: root.getColor(model.colorRef)
                                            opacity: 0.2
                                        }
                                        Text {
                                            id: unitText
                                            anchors.centerIn: parent
                                            text: model.unit
                                            color: root.getColor(model.colorRef)
                                            font.pixelSize: 11
                                            font.weight: Font.Medium
                                        }
                                    }
                                }

                                Text {
                                    text: model.val
                                    font.pixelSize: 28
                                    font.weight: Font.Bold
                                    font.letterSpacing: -0.5
                                    color: root.getColor(model.colorRef)
                                    Layout.fillWidth: true
                                }

                                Canvas {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 32
                                    onPaint: {
                                        var ctx = getContext("2d");
                                        var c = root.getColor(model.colorRef);
                                        
                                        var val = model.val;
                                        // Normalize graph value to a max of 100 for drawing purposes (so network 312 doesn't fly off screen)
                                        var drawVal = Math.min(val, 100);
                                        var scaleX = width / 200.0;
                                        
                                        ctx.beginPath();
                                        ctx.moveTo(0, 32 - drawVal * 0.25);
                                        ctx.bezierCurveTo(30*scaleX, 32 - (drawVal+5)*0.25, 60*scaleX, 32 - (drawVal-6)*0.25, 100*scaleX, 32 - (drawVal+3)*0.25);
                                        ctx.quadraticCurveTo(160*scaleX, 32 - (drawVal-2)*0.25, 200*scaleX, 32 - drawVal * 0.25);
                                        
                                        ctx.strokeStyle = c;
                                        ctx.lineWidth = 1.5;
                                        ctx.stroke();
                                    }
                                }
                            }
                        }
                    }
                }

                // Two Columns: Top Processes & System Alerts
                GridLayout {
                    columns: 2
                    columnSpacing: 24
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    // Top Processes
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop
                        spacing: 12

                        Text {
                            text: "Top Processes"
                            font.pixelSize: 11
                            font.weight: Font.Medium
                            color: MythColors.textSecondary
                            font.capitalization: Font.AllUppercase
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: processCol.implicitHeight
                            color: "#0affffff"
                            border.color: MythColors.borderSubtle
                            radius: 8
                            clip: true

                            ColumnLayout {
                                id: processCol
                                anchors.left: parent.left
                                anchors.right: parent.right
                                spacing: 0

                                Repeater {
                                    model: ListModel {
                                        ListElement { name: "myth-ai-daemon"; cpu: 12.4; mem: 312 }
                                        ListElement { name: "myth-compositor"; cpu: 8.7; mem: 248 }
                                        ListElement { name: "kernel-thread"; cpu: 4.1; mem: 8 }
                                        ListElement { name: "myth-store"; cpu: 0.2; mem: 64 }
                                        ListElement { name: "myth-update"; cpu: 0.0; mem: 20 }
                                    }

                                    Rectangle {
                                        Layout.fillWidth: true
                                        implicitHeight: 40
                                        color: "transparent"

                                        RowLayout {
                                            anchors.fill: parent
                                            anchors.leftMargin: 16
                                            anchors.rightMargin: 16
                                            spacing: 12

                                            Text {
                                                text: model.name
                                                font.family: "JetBrains Mono"
                                                font.pixelSize: 12
                                                color: MythColors.textPrimary
                                                Layout.fillWidth: true
                                            }
                                            Text {
                                                text: Number(model.cpu).toFixed(1) + "%"
                                                font.family: "JetBrains Mono"
                                                font.pixelSize: 11
                                                color: model.cpu > 10 ? MythColors.warning : MythColors.textSecondary
                                                Layout.minimumWidth: 48
                                                horizontalAlignment: Text.AlignRight
                                            }
                                            Text {
                                                text: model.mem + " MB"
                                                font.family: "JetBrains Mono"
                                                font.pixelSize: 11
                                                color: MythColors.textMuted
                                                Layout.minimumWidth: 64
                                                horizontalAlignment: Text.AlignRight
                                            }
                                        }

                                        Rectangle {
                                            anchors.bottom: parent.bottom
                                            anchors.left: parent.left
                                            anchors.right: parent.right
                                            height: 1
                                            color: MythColors.borderSubtle
                                            visible: index < 4
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // System Alerts
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop
                        spacing: 12

                        Text {
                            text: "System Alerts"
                            font.pixelSize: 11
                            font.weight: Font.Medium
                            color: MythColors.textSecondary
                            font.capitalization: Font.AllUppercase
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 8

                            Repeater {
                                model: ListModel {
                                    ListElement { msg: "Storage at 78% — consider cleanup"; colorRef: "warning" }
                                    ListElement { msg: "AI daemon using 12% CPU — normal"; colorRef: "cyan" }
                                    ListElement { msg: "All security checks passed"; colorRef: "success" }
                                }

                                Item {
                                    Layout.fillWidth: true
                                    implicitHeight: 44

                                    Rectangle {
                                        anchors.fill: parent
                                        color: "#0affffff"
                                        radius: 8
                                    }

                                    Rectangle {
                                        anchors.fill: parent
                                        color: "transparent"
                                        radius: 8
                                        border.color: root.getColor(model.colorRef)
                                        opacity: 0.25
                                    }

                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: 16
                                        anchors.rightMargin: 16
                                        spacing: 12

                                        Rectangle {
                                            width: 8
                                            height: 8
                                            radius: 4
                                            color: root.getColor(model.colorRef)
                                        }

                                        Text {
                                            text: model.msg
                                            font.pixelSize: 13
                                            color: MythColors.textPrimary
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
