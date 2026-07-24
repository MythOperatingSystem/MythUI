import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    property string viewMode: "default"

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: root.width
            spacing: 24

            Item { Layout.preferredHeight: 8 }

            // Page H1 and Sub
            ColumnLayout {
                Layout.leftMargin: 24
                Layout.rightMargin: 24
                spacing: 8

                RowLayout {
                    spacing: 8
                    Rectangle {
                        width: 24
                        height: 24
                        radius: 6
                        color: MythColors.borderSubtle
                        Text {
                            anchors.centerIn: parent
                            text: "14"
                            color: MythColors.textPrimary
                            font.bold: true
                            font.pixelSize: 11
                        }
                    }
                    Text {
                        text: "Desktop Shell"
                        font.pixelSize: MythTypography.h1
                        color: MythColors.textPrimary
                    }
                }

                Text {
                    text: "Top bar, wallpaper, dock, context menu, and workspace variants."
                    font.pixelSize: MythTypography.body1
                    color: MythColors.textMuted
                }
            }

            // View modes buttons
            RowLayout {
                Layout.leftMargin: 24
                Layout.rightMargin: 24
                spacing: 8

                Repeater {
                    model: ["default", "focused", "multiwindow"]
                    delegate: Rectangle {
                        property bool isSelected: root.viewMode === modelData
                        width: Math.max(btnText.implicitWidth + 28, 60)
                        height: 28
                        radius: 8
                        color: isSelected ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.15) : "transparent"
                        border.color: isSelected ? MythColors.mythCyan : MythColors.borderSubtle

                        Text {
                            id: btnText
                            anchors.centerIn: parent
                            text: modelData.charAt(0).toUpperCase() + modelData.substring(1)
                            color: parent.isSelected ? MythColors.mythCyan : MythColors.textSecondary
                            font.family: "Inter"
                            font.pixelSize: 12
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: root.viewMode = modelData
                        }
                    }
                }
            }

            // Preview Window
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 560
                Layout.leftMargin: 24
                Layout.rightMargin: 24
                Layout.bottomMargin: 24
                radius: 20
                color: "#0a0b13"
                border.color: MythColors.borderSubtle
                clip: true

                // Background pattern (approximate)
                Rectangle {
                    anchors.centerIn: parent
                    width: 500
                    height: 500
                    radius: 250
                    color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.07)
                }

                // Top bar
                Rectangle {
                    id: topBar
                    width: parent.width
                    height: 40
                    color: Qt.rgba(13/255, 14/255, 21/255, 0.9)
                    z: 10

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: MythColors.borderSubtle
                        anchors.bottom: parent.bottom
                    }

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 18
                        anchors.rightMargin: 18

                        // Logo
                        RowLayout {
                            spacing: 8
                            Layout.minimumWidth: 120
                            Rectangle { width: 18; height: 18; radius: 9; color: MythColors.mythCyan }
                            Text {
                                text: "MythOS"
                                color: MythColors.textPrimary
                                font.pixelSize: 13
                                font.bold: true
                            }
                        }

                        // Workspaces
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 4
                            Item { Layout.fillWidth: true }
                            Repeater {
                                model: ["main", "dev", "ai", "media"]
                                delegate: Rectangle {
                                    property bool isDev: index === 1
                                    width: wsText.implicitWidth + 20
                                    height: 20
                                    radius: 5
                                    color: isDev ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.18) : "transparent"
                                    border.color: isDev ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.4) : "transparent"
                                    Text {
                                        id: wsText
                                        anchors.centerIn: parent
                                        text: modelData
                                        color: parent.isDev ? MythColors.mythCyan : MythColors.textMuted
                                        font.family: "JetBrains Mono"
                                        font.pixelSize: 10
                                    }
                                }
                            }
                            Item { Layout.fillWidth: true }
                        }

                        // Right icons
                        RowLayout {
                            spacing: 14
                            Layout.minimumWidth: 160
                            Layout.alignment: Qt.AlignRight

                            Text { text: "WiFi"; color: MythColors.textSecondary; font.pixelSize: 14 }
                            Text { text: "Battery"; color: MythColors.textSecondary; font.pixelSize: 14 }
                            Text { text: "Volume"; color: MythColors.textSecondary; font.pixelSize: 14 }
                            Rectangle { width: 6; height: 6; radius: 3; color: MythColors.mythPurple }
                            Text {
                                text: Qt.formatDateTime(new Date(), "hh:mm")
                                color: MythColors.textSecondary
                                font.family: "JetBrains Mono"
                                font.pixelSize: 11
                            }
                        }
                    }
                }

                // Desktop area
                Item {
                    anchors.top: topBar.bottom
                    anchors.bottom: dockContainer.top
                    anchors.left: parent.left
                    anchors.right: parent.right

                    // Default View
                    Rectangle {
                        visible: root.viewMode !== "focused"
                        x: 28
                        y: 24
                        width: 300
                        height: 120
                        color: Qt.rgba(23/255, 26/255, 36/255, 0.9)
                        border.color: MythColors.borderSubtle
                        radius: 14
                        clip: true

                        Rectangle {
                            id: termHeader
                            width: parent.width
                            height: 32
                            color: Qt.rgba(1, 1, 1, 0.02)
                            Rectangle { width: parent.width; height: 1; color: MythColors.borderSubtle; anchors.bottom: parent.bottom }

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 13
                                anchors.rightMargin: 13
                                RowLayout {
                                    spacing: 5
                                    Rectangle { width: 7; height: 7; radius: 3.5; color: MythColors.error; opacity: 0.8 }
                                    Rectangle { width: 7; height: 7; radius: 3.5; color: MythColors.warning; opacity: 0.8 }
                                    Rectangle { width: 7; height: 7; radius: 3.5; color: MythColors.success; opacity: 0.8 }
                                }
                                Text { Layout.fillWidth: true; text: "Myth Terminal"; color: MythColors.textSecondary; font.pixelSize: 11; horizontalAlignment: Text.AlignHCenter }
                            }
                        }

                        ColumnLayout {
                            anchors.top: termHeader.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 14
                            spacing: 4
                            Text { text: "<font color='" + MythColors.mythCyan + "'>myth@ws ~ $</font> <font color='" + MythColors.textPrimary + "'>system status</font>"; textFormat: Text.RichText; font.family: "JetBrains Mono"; font.pixelSize: 11 }
                            Text { text: "  AI Core → ONLINE"; color: MythColors.success; font.family: "JetBrains Mono"; font.pixelSize: 11 }
                            Text { text: "  Uptime → 4d 7h 32m"; color: MythColors.textSecondary; font.family: "JetBrains Mono"; font.pixelSize: 11 }
                            Text { text: "<font color='" + MythColors.mythCyan + "'>myth@ws ~ $</font> <font color='" + MythColors.textPrimary + "'>_</font>"; textFormat: Text.RichText; font.family: "JetBrains Mono"; font.pixelSize: 11 }
                        }
                    }

                    // Multiwindow View
                    Rectangle {
                        visible: root.viewMode === "multiwindow"
                        x: parent.width - width - 28
                        y: 30
                        width: 260
                        height: 140
                        color: Qt.rgba(23/255, 26/255, 36/255, 0.9)
                        border.color: MythColors.borderSubtle
                        radius: 14
                        clip: true

                        Rectangle {
                            id: hubHeader
                            width: parent.width
                            height: 32
                            color: "transparent"
                            Rectangle { width: parent.width; height: 1; color: MythColors.borderSubtle; anchors.bottom: parent.bottom }

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 13
                                anchors.rightMargin: 13
                                RowLayout {
                                    spacing: 5
                                    Rectangle { width: 7; height: 7; radius: 3.5; color: MythColors.error; opacity: 0.8 }
                                    Rectangle { width: 7; height: 7; radius: 3.5; color: MythColors.warning; opacity: 0.8 }
                                    Rectangle { width: 7; height: 7; radius: 3.5; color: MythColors.success; opacity: 0.8 }
                                }
                                Text { Layout.fillWidth: true; text: "Myth Hub"; color: MythColors.textSecondary; font.pixelSize: 11; horizontalAlignment: Text.AlignHCenter }
                            }
                        }

                        ColumnLayout {
                            anchors.top: hubHeader.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 14
                            spacing: 8

                            Repeater {
                                model: ListModel {
                                    ListElement { l: "CPU"; v: 34; c: "cyan" }
                                    ListElement { l: "MEM"; v: 61; c: "purple" }
                                    ListElement { l: "GPU"; v: 22; c: "success" }
                                }
                                delegate: ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 3
                                    RowLayout {
                                        Layout.fillWidth: true
                                        Text { text: model.l; color: MythColors.textSecondary; font.family: "JetBrains Mono"; font.pixelSize: 9 }
                                        Item { Layout.fillWidth: true }
                                        Text {
                                            text: model.v + "%"
                                            color: model.c === "cyan" ? MythColors.mythCyan : (model.c === "purple" ? MythColors.mythPurple : MythColors.success)
                                            font.family: "JetBrains Mono"; font.pixelSize: 9
                                        }
                                    }
                                    Rectangle {
                                        Layout.fillWidth: true; height: 3; radius: 2; color: Qt.rgba(1, 1, 1, 0.06)
                                        Rectangle {
                                            width: parent.width * (model.v / 100)
                                            height: parent.height
                                            radius: 2
                                            color: model.c === "cyan" ? MythColors.mythCyan : (model.c === "purple" ? MythColors.mythPurple : MythColors.success)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Focused View
                    Rectangle {
                        visible: root.viewMode === "focused"
                        anchors.fill: parent
                        anchors.margins: 12
                        color: Qt.rgba(23/255, 26/255, 36/255, 0.85)
                        border.color: MythColors.borderSubtle
                        radius: 14
                        clip: true

                        Rectangle {
                            id: focusHeader
                            width: parent.width
                            height: 38
                            color: "transparent"
                            Rectangle { width: parent.width; height: 1; color: MythColors.borderSubtle; anchors.bottom: parent.bottom }

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                RowLayout {
                                    spacing: 5
                                    Rectangle { width: 8; height: 8; radius: 4; color: MythColors.error; opacity: 0.8 }
                                    Rectangle { width: 8; height: 8; radius: 4; color: MythColors.warning; opacity: 0.8 }
                                    Rectangle { width: 8; height: 8; radius: 4; color: MythColors.success; opacity: 0.8 }
                                }
                                Text { Layout.fillWidth: true; text: "Myth Terminal — Full Focus"; color: MythColors.textSecondary; font.pixelSize: 12; horizontalAlignment: Text.AlignHCenter }
                            }
                        }

                        ColumnLayout {
                            anchors.top: focusHeader.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 20
                            spacing: 8
                            Text { text: "<font color='" + MythColors.mythCyan + "'>myth@workstation ~ $</font> <font color='" + MythColors.textPrimary + "'>git log --oneline</font>"; textFormat: Text.RichText; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                            Text { text: "a3f2b1c feat: Add AI context awareness"; color: MythColors.textSecondary; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                            Text { text: "8d91e4a fix: Resolve compositor memory leak"; color: MythColors.textSecondary; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                            Text { text: "2c7a0f3 docs: Update kernel API reference"; color: MythColors.textSecondary; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                            Text { text: "<font color='" + MythColors.mythCyan + "'>myth@workstation ~ $</font> <font color='" + MythColors.textPrimary + "'>_</font>"; textFormat: Text.RichText; font.family: "JetBrains Mono"; font.pixelSize: 13 }
                        }
                    }
                }

                // Dock
                Item {
                    id: dockContainer
                    width: parent.width
                    height: 60
                    anchors.bottom: parent.bottom
                    z: 10

                    Rectangle {
                        anchors.centerIn: parent
                        width: dockLayout.implicitWidth + 20
                        height: 52
                        color: Qt.rgba(23/255, 26/255, 36/255, 0.9)
                        border.color: MythColors.borderStrong
                        radius: 18

                        RowLayout {
                            id: dockLayout
                            anchors.centerIn: parent
                            spacing: 4

                            Repeater {
                                model: ["◱", ">", "⊕", "⌥", "◈", "✉", "◻", "⚙"]
                                delegate: Item {
                                    width: 38
                                    height: 38

                                    Rectangle {
                                        anchors.fill: parent
                                        radius: 10
                                        color: index === 4 ? Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.3) :
                                               index === 1 ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.15) :
                                               Qt.rgba(1, 1, 1, 0.05)
                                        border.color: index === 1 ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.4) : MythColors.borderSubtle

                                        Text {
                                            anchors.centerIn: parent
                                            text: modelData
                                            color: index === 4 ? MythColors.mythPurple : index === 1 ? MythColors.mythCyan : MythColors.textSecondary
                                            font.pixelSize: 15
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                        }
                                    }

                                    Rectangle {
                                        visible: index === 1 || index === 4
                                        width: 4
                                        height: 4
                                        radius: 2
                                        color: index === 4 ? MythColors.mythPurple : MythColors.mythCyan
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: -7
                                        anchors.horizontalCenter: parent.horizontalCenter
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
