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
            width: root.width
            spacing: 32

            // Page Header
            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 40
                spacing: 8

                Rectangle {
                    color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.1)
                    radius: 12
                    Layout.preferredHeight: 24
                    Layout.preferredWidth: badgeRow.width + 16
                    Layout.alignment: Qt.AlignHCenter
                    
                    RowLayout {
                        id: badgeRow
                        anchors.centerIn: parent
                        spacing: 4
                        Text {
                            text: "17"
                            color: MythColors.mythCyan
                            font: MythTypography.caption
                        }
                        Text {
                            text: "Control Center"
                            color: MythColors.mythCyan
                            font: MythTypography.caption
                        }
                    }
                }

                Text {
                    text: "Control Center"
                    font: MythTypography.h1
                    color: MythColors.textPrimary
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Text {
                    text: "Quick controls, sliders, and system status — floating panel."
                    font: MythTypography.body
                    color: MythColors.textSecondary
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            // Floating Panel
            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 360
                Layout.preferredHeight: panelContent.implicitHeight + 48
                color: Qt.rgba(23/255, 26/255, 36/255, 0.95)
                border.color: MythColors.borderStrong
                border.width: 1
                radius: 24
                
                ColumnLayout {
                    id: panelContent
                    anchors.fill: parent
                    anchors.margins: 24
                    spacing: 0

                    Text {
                        text: "Control Center"
                        font.pixelSize: 15
                        font.weight: Font.DemiBold
                        color: MythColors.textPrimary
                        Layout.bottomMargin: 18
                    }

                    GridLayout {
                        columns: 2
                        columnSpacing: 8
                        rowSpacing: 8
                        Layout.fillWidth: true
                        Layout.bottomMargin: 20
                        
                        ControlToggle {
                            label: "Wi-Fi"
                            sub: "MythNet-5G"
                            colorOn: MythColors.mythCyan
                            iconName: "WiFi"
                            active: true
                        }
                        ControlToggle {
                            label: "Bluetooth"
                            sub: "2 devices"
                            colorOn: MythColors.mythCyan
                            iconName: "Bluetooth"
                            active: true
                        }
                        ControlToggle {
                            label: "Do Not Disturb"
                            sub: active ? "Until 9:00" : "Off"
                            colorOn: MythColors.purple
                            iconName: "Notifications"
                            active: false
                        }
                        ControlToggle {
                            label: "Night Light"
                            sub: active ? "Active" : "Disabled"
                            colorOn: MythColors.warning
                            iconName: "Brightness"
                            active: false
                        }
                    }

                    ControlSlider {
                        label: "Brightness"
                        iconName: "Brightness"
                        sliderColor: MythColors.warning
                        value: 70
                        Layout.fillWidth: true
                        Layout.bottomMargin: 16
                    }
                    
                    ControlSlider {
                        label: "Volume"
                        iconName: "Volume"
                        sliderColor: MythColors.mythCyan
                        value: 55
                        Layout.fillWidth: true
                        Layout.bottomMargin: 16
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.topMargin: 4
                        Layout.preferredHeight: networkLayout.implicitHeight + 28
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.03)
                        radius: 12
                        border.color: MythColors.borderSubtle
                        border.width: 1

                        ColumnLayout {
                            id: networkLayout
                            anchors.fill: parent
                            anchors.topMargin: 14
                            anchors.bottomMargin: 14
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 0
                            
                            Text {
                                text: "Network"
                                font.pixelSize: 12
                                color: MythColors.textSecondary
                                Layout.bottomMargin: 8
                            }
                            
                            RowLayout {
                                Layout.fillWidth: true
                                Layout.bottomMargin: 4
                                Text {
                                    text: "MythNet-5G"
                                    font.family: "JetBrains Mono"
                                    font.pixelSize: 11
                                    color: MythColors.textPrimary
                                }
                                Item { Layout.fillWidth: true }
                                Rectangle {
                                    color: Qt.rgba(MythColors.success.r, MythColors.success.g, MythColors.success.b, 0.2)
                                    border.color: Qt.rgba(MythColors.success.r, MythColors.success.g, MythColors.success.b, 0.5)
                                    border.width: 1
                                    radius: 10
                                    implicitWidth: badgeText.width + 12
                                    implicitHeight: 20
                                    Text {
                                        id: badgeText
                                        anchors.centerIn: parent
                                        text: "Connected"
                                        font.pixelSize: 10
                                        color: MythColors.success
                                    }
                                }
                            }
                            
                            RowLayout {
                                Layout.fillWidth: true
                                Text {
                                    text: "↑ 48 Mbps"
                                    font.family: "JetBrains Mono"
                                    font.pixelSize: 10
                                    color: MythColors.textMuted
                                }
                                Item { Layout.fillWidth: true }
                                Text {
                                    text: "↓ 312 Mbps"
                                    font.family: "JetBrains Mono"
                                    font.pixelSize: 10
                                    color: MythColors.textMuted
                                }
                            }
                        }
                    }
                    
                    Item { Layout.fillHeight: true }
                }
            }
            
            Item { Layout.preferredHeight: 60 }
        }
    }

    component ControlToggle: Rectangle {
        id: toggleRoot
        property string label: ""
        property string sub: ""
        property color colorOn: MythColors.mythCyan
        property string iconName: ""
        property bool active: false

        Layout.fillWidth: true
        Layout.preferredHeight: 74
        
        color: active ? Qt.rgba(colorOn.r, colorOn.g, colorOn.b, 0.12) : Qt.rgba(255/255, 255/255, 255/255, 0.04)
        border.color: active ? Qt.rgba(colorOn.r, colorOn.g, colorOn.b, 0.3) : MythColors.borderSubtle
        border.width: 1
        radius: 14

        MouseArea {
            anchors.fill: parent
            onClicked: toggleRoot.active = !toggleRoot.active
            cursorShape: Qt.PointingHandCursor
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 14
            spacing: 0

            Rectangle {
                width: 16
                height: 16
                color: "transparent"
                Layout.bottomMargin: 6
                Text {
                    anchors.centerIn: parent
                    text: toggleRoot.iconName.substring(0,1)
                    color: toggleRoot.active ? toggleRoot.colorOn : MythColors.textMuted
                    font.pixelSize: 12
                }
            }

            Text {
                text: toggleRoot.label
                font.pixelSize: 13
                font.weight: Font.DemiBold
                color: toggleRoot.active ? toggleRoot.colorOn : MythColors.textPrimary
            }

            Text {
                text: toggleRoot.sub
                font.pixelSize: 11
                color: MythColors.textMuted
            }
            
            Item { Layout.fillHeight: true }
        }
        
        Behavior on color { ColorAnimation { duration: 150 } }
        Behavior on border.color { ColorAnimation { duration: 150 } }
    }

    component ControlSlider: Item {
        id: sliderRoot
        property string label: ""
        property string iconName: ""
        property color sliderColor: MythColors.mythCyan
        property real value: 50

        Layout.fillWidth: true
        Layout.preferredHeight: 38

        ColumnLayout {
            anchors.fill: parent
            spacing: 8

            RowLayout {
                Layout.fillWidth: true
                spacing: 8
                
                Rectangle {
                    width: 14
                    height: 14
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: sliderRoot.iconName.substring(0,1)
                        color: sliderRoot.sliderColor
                        font.pixelSize: 10
                    }
                }

                Text {
                    text: sliderRoot.label
                    font.pixelSize: 13
                    font.weight: Font.Medium
                    color: MythColors.textPrimary
                }

                Item { Layout.fillWidth: true }

                Text {
                    text: Math.round(sliderRoot.value) + "%"
                    font.family: "JetBrains Mono"
                    font.pixelSize: 11
                    color: MythColors.textSecondary
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 4

                Rectangle {
                    anchors.fill: parent
                    color: Qt.rgba(255/255, 255/255, 255/255, 0.08)
                    radius: 2
                }

                Rectangle {
                    width: parent.width * (sliderRoot.value / 100)
                    height: parent.height
                    radius: 2
                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0.0; color: Qt.rgba(sliderRoot.sliderColor.r, sliderRoot.sliderColor.g, sliderRoot.sliderColor.b, 0.5) }
                        GradientStop { position: 1.0; color: sliderRoot.sliderColor }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: -8
                    cursorShape: Qt.PointingHandCursor
                    onPositionChanged: (mouse) => {
                        if (pressed) {
                            let ratio = mouse.x / width
                            ratio = Math.max(0, Math.min(1, ratio))
                            sliderRoot.value = ratio * 100
                        }
                    }
                    onClicked: (mouse) => {
                        let ratio = mouse.x / width
                        ratio = Math.max(0, Math.min(1, ratio))
                        sliderRoot.value = ratio * 100
                    }
                }
            }
        }
    }
}
