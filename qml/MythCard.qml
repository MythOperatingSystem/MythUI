import MythUI
import QtQuick 6.0
import QtQuick.Controls 6.0

Rectangle {
    id: card

    property string cardTitle: ""
    property string variant: "elevated"
    property bool showHeader: cardTitle !== ""
    property int headerHeight: 56
    property int contentPadding: 24

    default property alias content: contentArea.data

    color: MythColors.elevated
    border.color: mouseArea.containsMouse ? Qt.rgba(1, 1, 1, 0.15) : MythColors.borderSubtle
    border.width: 1
    radius: 24

    transform: Translate {
        y: mouseArea.containsMouse ? -2 : 0
        Behavior on y {
            NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
        }
    }

    Behavior on border.color {
        ColorAnimation { duration: 250; easing.type: Easing.OutCubic }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }

    Column {
        anchors.fill: parent

        Item {
            id: headerArea
            width: parent.width
            height: card.showHeader ? card.headerHeight : 0
            visible: card.showHeader

            Text {
                text: card.cardTitle
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: card.contentPadding
                anchors.rightMargin: card.contentPadding
                color: MythColors.textPrimary
                font.family: MythTypography.uiFont
                font.pixelSize: MythTypography.h3Size
                font.weight: Font.DemiBold
            }

            Rectangle {
                width: parent.width
                height: 1
                color: MythColors.borderSubtle
                anchors.bottom: parent.bottom
            }
        }

        Item {
            id: contentAreaWrapper
            width: parent.width
            height: parent.height - headerArea.height

            Item {
                id: contentArea
                anchors.fill: parent
                anchors.margins: card.contentPadding
            }
        }
    }
}
