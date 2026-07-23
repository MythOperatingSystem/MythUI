import QtQuick 6.0
import QtQuick.Controls 6.0
import "theme" as Theme

Button {
    id: control

    property string variant: "primary"
    property string iconSource: ""
    
    implicitHeight: 44
    leftPadding: 20
    rightPadding: 20

    opacity: enabled ? 1.0 : 0.4
    Behavior on opacity {
        NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
    }

    contentItem: Row {
        spacing: 8
        anchors.centerIn: parent

        Image {
            id: iconImage
            source: control.iconSource
            visible: control.iconSource !== ""
            sourceSize.width: 16
            sourceSize.height: 16
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            text: control.text
            font.family: Theme.MythTypography.uiFont
            font.pixelSize: Theme.MythTypography.bodySize
            font.weight: Font.SemiBold
            color: {
                if (control.variant === "primary") return Theme.MythColors.voidBlack
                if (control.variant === "danger") return "#FFFFFF"
                return Theme.MythColors.textPrimary
            }
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    background: Rectangle {
        id: bgRect
        radius: 12
        border.width: control.variant === "secondary" ? 1 : 0
        border.color: control.variant === "secondary" ? Theme.MythColors.mythCyan : "transparent"

        color: {
            if (control.variant === "primary") {
                return control.pressed ? Qt.darker(Theme.MythColors.mythCyan, 1.2) : Theme.MythColors.mythCyan
            } else if (control.variant === "secondary") {
                return control.pressed ? Qt.lighter(Theme.MythColors.elevated, 1.2) : Theme.MythColors.elevated
            } else if (control.variant === "danger") {
                return control.pressed ? Qt.darker(Theme.MythColors.error, 1.2) : Theme.MythColors.error
            } else if (control.variant === "ghost") {
                return control.pressed ? Qt.rgba(1, 1, 1, 0.1) : (control.hovered ? Qt.rgba(1, 1, 1, 0.05) : "transparent")
            }
            return Theme.MythColors.mythCyan
        }

        Behavior on color {
            ColorAnimation { duration: 250; easing.type: Easing.OutCubic }
        }
        
        scale: control.pressed ? 0.98 : (control.hovered ? 1.02 : 1.0)
        Behavior on scale {
            NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.NoButton
    }
}
