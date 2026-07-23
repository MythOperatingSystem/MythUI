import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI

Item {
    id: root
    anchors.fill: parent
    
    property int currentFrame: 2

    property var framesData: [
        { num: 1, label: "System Start", desc: "Black screen. Hardware POST complete." },
        { num: 2, label: "Logo Appears", desc: "MythOS symbol fades in at center." },
        { num: 3, label: "Cyan Line Init", desc: "Single cyan line animates left to right." },
        { num: 4, label: "Loading Complete", desc: "Line resolves. System ready." },
        { num: 5, label: "Transition to Login", desc: "Smooth fade to lock screen." }
    ]

    property var fallbacksData: [
        { label: "Recovery Mode", colorState: MythColors.warning, desc: "Enter recovery shell or rollback" },
        { label: "Hardware Issue", colorState: MythColors.error, desc: "Display sensor/component error" },
        { label: "Safe Mode", colorState: MythColors.textSecondary, desc: "Minimal drivers, no compositing" }
    ]

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 24

            // Page Header
            ColumnLayout {
                spacing: 8
                
                // PageBadge
                Rectangle {
                    color: "transparent"
                    border.color: MythColors.borderSubtle
                    radius: 4
                    implicitWidth: badgeRow.implicitWidth + 16
                    implicitHeight: badgeRow.implicitHeight + 8
                    
                    RowLayout {
                        id: badgeRow
                        anchors.centerIn: parent
                        spacing: 8
                        
                        Text {
                            text: "10"
                            color: MythColors.mythCyan
                            font: MythTypography.mono
                        }
                        Rectangle {
                            width: 1
                            height: 12
                            color: MythColors.borderSubtle
                        }
                        Text {
                            text: "Boot Experience"
                            color: MythColors.textPrimary
                            font: MythTypography.caption
                        }
                    }
                }

                Text {
                    text: "Boot Experience"
                    font: MythTypography.h1
                    color: MythColors.textPrimary
                }
                
                Text {
                    text: "3–5 second boot on capable hardware. Clean, silent, confident."
                    font: MythTypography.body
                    color: MythColors.textSecondary
                }
            }

            // SectionTag: Boot Storyboard
            Text {
                text: "Boot Storyboard"
                font: MythTypography.h3
                color: MythColors.textPrimary
                Layout.topMargin: 16
            }
            
            // Frame buttons
            RowLayout {
                spacing: 8
                Layout.bottomMargin: 8
                
                Repeater {
                    model: root.framesData
                    delegate: Rectangle {
                        property int frameNum: modelData.num
                        property bool isSelected: root.currentFrame === frameNum
                        
                        implicitWidth: btnText.implicitWidth + 28
                        implicitHeight: btnText.implicitHeight + 12
                        radius: 8
                        border.color: isSelected ? MythColors.mythCyan : MythColors.borderSubtle
                        color: "transparent"
                        
                        Rectangle {
                            anchors.fill: parent
                            radius: 8
                            color: MythColors.mythCyan
                            opacity: isSelected ? 0.15 : 0.0
                        }
                        
                        Text {
                            id: btnText
                            anchors.centerIn: parent
                            text: frameNum
                            color: isSelected ? MythColors.mythCyan : MythColors.textSecondary
                            font: MythTypography.mono
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: root.currentFrame = frameNum
                        }
                    }
                }
            }
            
            // Grid layout
            RowLayout {
                spacing: 24
                Layout.fillWidth: true
                Layout.bottomMargin: 24
                
                // Boot screen preview (2fr)
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 360
                    Layout.preferredWidth: 200 // Scales proportionally
                    radius: 16
                    color: MythColors.voidBlack
                    border.color: MythColors.borderSubtle
                    clip: true
                    
                    // Logo Area
                    Rectangle {
                        anchors.centerIn: parent
                        width: root.currentFrame >= 3 ? 72 : 56
                        height: width
                        color: "transparent"
                        visible: root.currentFrame >= 2
                        
                        Text {
                            anchors.centerIn: parent
                            text: "M"
                            color: "white"
                            font.pixelSize: parent.width * 0.6
                        }
                    }
                    
                    // Cyan Line
                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * 0.3
                        height: 1
                        width: root.currentFrame === 3 ? 120 : (root.currentFrame >= 4 ? 240 : 0)
                        color: MythColors.mythCyan
                        visible: root.currentFrame >= 3
                        
                        Behavior on width {
                            NumberAnimation { duration: 600; easing.type: Easing.InOutQuad }
                        }
                    }
                    
                    // READY
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height * 0.28
                        text: "READY"
                        font: MythTypography.mono
                        font.pixelSize: 10
                        font.letterSpacing: 2
                        color: MythColors.mythCyan
                        opacity: 0.8
                        visible: root.currentFrame >= 4
                    }
                    
                    // POST COMPLETE
                    Text {
                        anchors.centerIn: parent
                        text: "POST COMPLETE"
                        font: MythTypography.mono
                        font.pixelSize: 11
                        font.letterSpacing: 1
                        color: "#333333"
                        visible: root.currentFrame === 1
                    }
                }
                
                // Storyboard list (1fr)
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.preferredWidth: 100 // Scales proportionally (half of 200 -> 2fr/1fr)
                    spacing: 8
                    Layout.alignment: Qt.AlignTop
                    
                    Repeater {
                        model: root.framesData
                        delegate: Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: rowContent.implicitHeight + 24
                            color: "transparent"
                            radius: 8
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 8
                                color: "transparent"
                                border.color: root.currentFrame === modelData.num ? MythColors.mythCyan : MythColors.borderSubtle
                                opacity: root.currentFrame === modelData.num ? 0.4 : 1.0
                            }
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 8
                                color: "#FFFFFF"
                                opacity: 0.05
                                z: -1
                            }
                            
                            RowLayout {
                                id: rowContent
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                spacing: 10
                                
                                Text {
                                    text: modelData.num < 10 ? "0" + modelData.num : modelData.num
                                    font: MythTypography.mono
                                    font.pixelSize: 10
                                    color: root.currentFrame === modelData.num ? MythColors.mythCyan : MythColors.textMuted
                                }
                                
                                ColumnLayout {
                                    spacing: 2
                                    Layout.fillWidth: true
                                    
                                    Text {
                                        text: modelData.label
                                        font: MythTypography.caption
                                        font.bold: true
                                        color: root.currentFrame === modelData.num ? MythColors.textPrimary : MythColors.textSecondary
                                    }
                                    
                                    Text {
                                        text: modelData.desc
                                        font: MythTypography.caption
                                        color: MythColors.textMuted
                                        wrapMode: Text.WordWrap
                                        Layout.fillWidth: true
                                    }
                                }
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: root.currentFrame = modelData.num
                            }
                        }
                    }
                }
            }

            // Fallback States Section
            Text {
                text: "Fallback States"
                font: MythTypography.h3
                color: MythColors.textPrimary
            }
            
            GridLayout {
                columns: 3
                rowSpacing: 10
                columnSpacing: 10
                Layout.fillWidth: true
                
                Repeater {
                    model: root.fallbacksData
                    delegate: Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: fallbackContent.implicitHeight + 40
                        color: "transparent"
                        radius: 8
                        
                        Rectangle {
                            anchors.fill: parent
                            radius: 8
                            color: "transparent"
                            border.color: modelData.colorState
                            border.width: 1
                            opacity: 0.3
                        }
                        
                        Rectangle {
                            anchors.fill: parent
                            radius: 8
                            color: "#FFFFFF"
                            opacity: 0.05
                            z: -1
                        }
                        
                        ColumnLayout {
                            id: fallbackContent
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 20
                            spacing: 10
                            
                            Rectangle {
                                color: "transparent"
                                radius: 4
                                implicitWidth: badgeText.implicitWidth + 12
                                implicitHeight: badgeText.implicitHeight + 8
                                
                                Rectangle {
                                    anchors.fill: parent
                                    radius: 4
                                    color: modelData.colorState
                                    opacity: 0.2
                                }
                                
                                Text {
                                    id: badgeText
                                    anchors.centerIn: parent
                                    text: modelData.label
                                    color: modelData.colorState
                                    font: MythTypography.caption
                                    font.bold: true
                                }
                            }
                            
                            Text {
                                text: modelData.desc
                                color: MythColors.textSecondary
                                font: MythTypography.caption
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
