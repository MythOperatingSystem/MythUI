import QtQuick 6.0
import QtQuick.Controls 6.0
import "theme" as Theme

Item {
    id: root

    property bool checked: false
    property string labelText: ""
    property bool enabled: true

    implicitWidth: track.width + (labelText !== "" ? 8 + label.implicitWidth : 0)
    implicitHeight: Math.max(track.height, labelText !== "" ? label.implicitHeight : 0)

    opacity: enabled ? 1.0 : 0.4
    Behavior on opacity {
        NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
    }

    signal toggled(bool checked)

    Row {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 8

        Rectangle {
            id: track
            width: 48
            height: 26
            radius: 13
            color: root.checked ? Theme.MythColors.mythCyan : Theme.MythColors.overlay
            border.color: root.checked ? "transparent" : Theme.MythColors.borderSubtle
            border.width: 1

            Behavior on color {
                ColorAnimation { duration: 250; easing.type: Easing.OutCubic }
            }

            Rectangle {
                id: thumb
                width: 20
                height: 20
                radius: 10
                color: "#F5F7FF"
                y: 3
                x: root.checked ? 25 : 3

                Behavior on x {
                    NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
                }
                
                border.color: Qt.rgba(0,0,0,0.1)
                border.width: 1
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (root.enabled) {
                        root.checked = !root.checked;
                        root.toggled(root.checked);
                    }
                }
                cursorShape: root.enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
            }
        }

        Text {
            id: label
            text: root.labelText
            visible: root.labelText !== ""
            color: Theme.MythColors.textPrimary
            font.family: Theme.MythTypography.uiFont
            font.pixelSize: Theme.MythTypography.bodySize
            anchors.verticalCenter: parent.verticalCenter
            
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (root.enabled) {
                        root.checked = !root.checked;
                        root.toggled(root.checked);
                    }
                }
                cursorShape: root.enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
            }
        }
    }
}
