import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0
import "theme" as Theme

Item {
    id: root
    width: 360
    height: Math.max(64, contentLayout.implicitHeight + 32)
    visible: showNotification || exitAnim.running || entranceAnim.running
    
    // Position slightly off the top-right
    anchors.top: parent ? parent.top : undefined
    anchors.right: parent ? parent.right : undefined
    anchors.topMargin: Theme.MythSpacing.lg
    anchors.rightMargin: Theme.MythSpacing.lg
    z: 1000

    property string message: ""
    property string type: "info" // "info", "success", "warning", "error"
    property int duration: 4000
    property bool showNotification: false

    signal dismissed()

    onShowNotificationChanged: {
        if (showNotification) {
            startShow();
        } else if (opacity > 0) {
            startHide();
        }
    }

    function show() {
        showNotification = true;
    }

    function hide() {
        showNotification = false;
    }

    function startShow() {
        hideTimer.stop();
        notificationCard.y = -100;
        notificationCard.opacity = 0;
        entranceAnim.start();
    }

    function startHide() {
        hideTimer.stop();
        exitAnim.start();
    }

    Timer {
        id: hideTimer
        interval: root.duration
        repeat: false
        onTriggered: {
            root.hide();
        }
    }

    ParallelAnimation {
        id: entranceAnim
        NumberAnimation {
            target: notificationCard
            property: "y"
            from: -100
            to: 0
            duration: Theme.MythMotion.entrance
            easing.type: Easing.OutCubic
        }
        NumberAnimation {
            target: notificationCard
            property: "opacity"
            from: 0
            to: 1
            duration: Theme.MythMotion.entrance
            easing.type: Easing.OutCubic
        }
        onFinished: {
            if (root.duration > 0) {
                hideTimer.start();
            }
        }
    }

    NumberAnimation {
        id: exitAnim
        target: notificationCard
        property: "opacity"
        to: 0
        duration: Theme.MythMotion.standard
        easing.type: Easing.OutCubic
        onFinished: {
            root.showNotification = false;
            root.dismissed();
        }
    }

    Rectangle {
        id: notificationCard
        width: parent.width
        height: parent.height
        color: Theme.MythColors.elevated
        radius: 16 // radiusLg
        border.color: Theme.MythColors.borderSubtle
        border.width: 1

        // Left accent border
        Rectangle {
            width: 3
            height: parent.height - 24
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.verticalCenter: parent.verticalCenter
            color: {
                switch(root.type) {
                    case "success": return Theme.MythColors.success;
                    case "warning": return Theme.MythColors.warning;
                    case "error": return Theme.MythColors.error;
                    case "info": 
                    default: return Theme.MythColors.mythCyan;
                }
            }
            radius: 1.5
        }

        RowLayout {
            id: contentLayout
            anchors.fill: parent
            anchors.margins: 16
            spacing: 12

            // Type icon indicator
            Rectangle {
                width: 8
                height: 8
                radius: 4
                Layout.alignment: Qt.AlignVCenter
                color: {
                    switch(root.type) {
                        case "success": return Theme.MythColors.success;
                        case "warning": return Theme.MythColors.warning;
                        case "error": return Theme.MythColors.error;
                        case "info": 
                        default: return Theme.MythColors.mythCyan;
                    }
                }
            }

            Text {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                text: root.message
                color: Theme.MythColors.textPrimary
                font.family: Theme.MythTypography.uiFont
                font.pixelSize: Theme.MythTypography.body
                wrapMode: Text.WordWrap
            }

            // Close button
            Item {
                Layout.alignment: Qt.AlignTop | Qt.AlignRight
                width: 20
                height: 20
                
                Text {
                    anchors.centerIn: parent
                    text: "×"
                    font.pixelSize: 20
                    color: closeMouseArea.containsMouse ? Theme.MythColors.textPrimary : Theme.MythColors.textSecondary
                    font.bold: true
                    Behavior on color { ColorAnimation { duration: Theme.MythMotion.fast } }
                }
                
                MouseArea {
                    id: closeMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        root.hide();
                    }
                }
            }
        }
    }
}
