import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import MythUI 1.0

Item {
    id: overlay
    anchors.fill: parent
    
    MythCard {
        width: 320
        height: 72
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 56
        color: Qt.rgba(MythColors.elevated.r, MythColors.elevated.g, MythColors.elevated.b, 0.65)
        border.color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.3)
        border.width: 1
        radius: 16
        

        
        RowLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 12
            
            Rectangle {
                width: 40
                height: 40
                radius: 20
                color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.2)
                
                MythIcon {
                    anchors.centerIn: parent
                    name: "ai"
                    iconColor: MythColors.mythPurple
                    iconSize: 20
                }
            }
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 2
                
                RowLayout {
                    Layout.fillWidth: true
                    Text { text: "Myth AI"; color: MythColors.textPrimary; font.bold: true; font.pixelSize: 13 }
                    Item { Layout.fillWidth: true }
                    Text { text: "Just now"; color: MythColors.textSecondary; font.pixelSize: 10 }
                }
                
                Text {
                    Layout.fillWidth: true
                    text: "Background optimization complete. System memory usage reduced by 450MB."
                    color: MythColors.textSecondary
                    font.pixelSize: 11
                    wrapMode: Text.WordWrap
                    lineHeight: 1.2
                }
            }
            
            Text {
                text: "✕"
                color: MythColors.textSecondary
                font.pixelSize: 12
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: 4
                
                MouseArea {
                    anchors.fill: parent
                    anchors.margins: -8
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
