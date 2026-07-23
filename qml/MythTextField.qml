import MythUI
import QtQuick 6.0
import QtQuick.Controls 6.0

Item {
    id: root
    
    property string labelText: ""
    property string placeholderText: ""
    property alias text: input.text
    property alias echoMode: input.echoMode
    property bool enabled: true

    implicitWidth: 200
    implicitHeight: (labelText !== "" ? labelItem.height + 4 : 0) + 44

    opacity: root.enabled ? 1.0 : 0.4
    Behavior on opacity {
        NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
    }

    Column {
        anchors.fill: parent
        spacing: 4

        Text {
            id: labelItem
            text: root.labelText
            visible: root.labelText !== ""
            color: MythColors.textSecondary
            font.family: MythTypography.uiFont
            font.pixelSize: 11
            font.capitalization: Font.AllUppercase
        }

        Rectangle {
            id: bgRect
            width: parent.width
            height: 44
            color: MythColors.elevated
            radius: 12
            border.width: 1
            border.color: input.activeFocus ? MythColors.mythCyan : MythColors.borderSubtle

            Behavior on border.color {
                ColorAnimation { duration: 250; easing.type: Easing.OutCubic }
            }

            Rectangle {
                anchors.fill: parent
                anchors.margins: -1
                radius: 13
                color: "transparent"
                border.color: MythColors.mythCyan
                border.width: 1
                opacity: input.activeFocus ? 0.3 : 0.0
                Behavior on opacity {
                    NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
                }
            }

            TextInput {
                id: input
                anchors.fill: parent
                anchors.leftMargin: 16
                anchors.rightMargin: 16
                verticalAlignment: TextInput.AlignVCenter
                color: MythColors.textPrimary
                font.family: MythTypography.uiFont
                font.pixelSize: MythTypography.bodySize
                enabled: root.enabled

                Text {
                    text: root.placeholderText
                    color: MythColors.textDisabled
                    font: input.font
                    visible: !input.text && !input.activeFocus
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
