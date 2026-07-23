import MythUI
import QtQuick 6.0
import QtQuick.Controls 6.0

Rectangle {
    id: rootWindow

    property string windowTitle: "Myth Application"
    property bool showTitleBar: true
    property int titleBarHeight: 48

    default property alias content: contentArea.data

    color: MythColors.surface
    radius: MythSpacing.radiusWindow
    border.color: MythColors.borderSubtle
    border.width: 1

    Column {
        anchors.fill: parent

        Rectangle {
            id: titleBar
            width: parent.width
            height: rootWindow.showTitleBar ? rootWindow.titleBarHeight : 0
            visible: rootWindow.showTitleBar
            color: MythColors.elevated
            
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
                font.family: MythTypography.uiFont
                font.pixelSize: MythTypography.bodyMedium
                color: MythColors.textSecondary
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
                    color: minHover.containsMouse ? Qt.lighter(MythColors.textSecondary, 1.2) : MythColors.textSecondary
                    Behavior on color { ColorAnimation { duration: 150 } }
                    MouseArea { id: minHover; anchors.fill: parent; hoverEnabled: true }
                }

                Rectangle {
                    width: 12
                    height: 12
                    radius: 6
                    color: maxHover.containsMouse ? Qt.lighter(MythColors.textSecondary, 1.2) : MythColors.textSecondary
                    Behavior on color { ColorAnimation { duration: 150 } }
                    MouseArea { id: maxHover; anchors.fill: parent; hoverEnabled: true }
                }

                Rectangle {
                    width: 12
                    height: 12
                    radius: 6
                    color: closeHover.containsMouse ? MythColors.error : MythColors.textSecondary
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
