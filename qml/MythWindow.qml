import QtQuick 6.0
import QtQuick.Controls 6.0
import "theme" as Theme

Rectangle {
    id: rootWindow

    property string windowTitle: "Myth Application"
    property bool showTitleBar: true
    property int titleBarHeight: 48

    default property alias content: contentArea.data

    color: Theme.MythColors.surface
    radius: 24

    Column {
        anchors.fill: parent

        Rectangle {
            id: titleBar
            width: parent.width
            height: rootWindow.showTitleBar ? rootWindow.titleBarHeight : 0
            visible: rootWindow.showTitleBar
            color: Theme.MythColors.elevated
            
            radius: rootWindow.radius
            Rectangle {
                width: parent.width
                height: parent.radius
                anchors.bottom: parent.bottom
                color: parent.color
            }

            Text {
                anchors.centerIn: parent
                text: rootWindow.windowTitle
                font.family: Theme.MythTypography.uiFont
                font.pixelSize: Theme.MythTypography.bodySize
                color: Theme.MythColors.textSecondary
            }

            Row {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 16
                spacing: 8

                Rectangle {
                    width: 12
                    height: 12
                    radius: 6
                    color: minHover.containsMouse ? Qt.lighter("#9CA3AF", 1.2) : "#9CA3AF"
                    Behavior on color { ColorAnimation { duration: 150 } }
                    MouseArea { id: minHover; anchors.fill: parent; hoverEnabled: true }
                }

                Rectangle {
                    width: 12
                    height: 12
                    radius: 6
                    color: maxHover.containsMouse ? Qt.lighter("#9CA3AF", 1.2) : "#9CA3AF"
                    Behavior on color { ColorAnimation { duration: 150 } }
                    MouseArea { id: maxHover; anchors.fill: parent; hoverEnabled: true }
                }

                Rectangle {
                    width: 12
                    height: 12
                    radius: 6
                    color: closeHover.containsMouse ? Theme.MythColors.error : "#9CA3AF"
                    Behavior on color { ColorAnimation { duration: 150 } }
                    MouseArea { id: closeHover; anchors.fill: parent; hoverEnabled: true }
                }
            }
        }

        Item {
            id: contentAreaWrapper
            width: parent.width
            height: parent.height - titleBar.height
            
            Item {
                id: contentArea
                anchors.fill: parent
            }
        }
    }
}
