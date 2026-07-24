import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import MythUI 1.0

Item {
    id: overlay
    anchors.fill: parent
    
    MythCard {
        width: 440
        height: 84
        contentPadding: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 56
        color: Qt.rgba(MythColors.elevated.r, MythColors.elevated.g, MythColors.elevated.b, 0.85)
        border.color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.4)
        border.width: 1
        radius: 16
        
        RowLayout {
            anchors.fill: parent
            anchors.margins: 8
            spacing: 14
            
            Rectangle {
                width: 44
                height: 44
                radius: 22
                color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.2)
                border.color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.4)
                border.width: 1
                
                MythIcon {
                    anchors.centerIn: parent
                    name: "ai"
                    iconColor: MythColors.mythPurple
                    iconSize: 22
                }
            }
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 3
                
                RowLayout {
                    Layout.fillWidth: true
                    Text { 
                        text: "Myth AI"
                        color: MythColors.textPrimary
                        font.family: MythTypography.uiFont
                        font.bold: true
                        font.pixelSize: 13 
                    }
                    Item { Layout.fillWidth: true }
                    Text { 
                        text: "Just now"
                        color: MythColors.textSecondary
                        font.family: MythTypography.uiFont
                        font.pixelSize: 11 
                    }
                }
                
                Text {
                    Layout.fillWidth: true
                    text: "Background optimization complete. System memory usage reduced by 450MB."
                    color: MythColors.textSecondary
                    font.family: MythTypography.uiFont
                    font.pixelSize: 12
                    wrapMode: Text.WordWrap
                    maximumLineCount: 2
                    elide: Text.ElideRight
                }
            }
            
            Text {
                text: "✕"
                color: MythColors.textSecondary
                font.pixelSize: 14
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: 2
                
                MouseArea {
                    anchors.fill: parent
                    anchors.margins: -8
                    cursorShape: Qt.PointingHandCursor
                    onClicked: overlay.parent.parent.showNotification = false
                }
            }
        }
        
        // Slide down animation
        NumberAnimation on y {
            from: -100
            to: 56
            duration: 300
            easing.type: Easing.OutBack
        }
        
        NumberAnimation on opacity {
            from: 0
            to: 1
            duration: 200
        }
    }
}
