import MythUI
import QtQuick 6.0
import QtQuick.Controls 6.0

Button {
    id: control

    property string variant: "primary" // primary, secondary, ghost, ai, danger, success
    property string size: "md" // sm, md, lg
    property string iconSource: ""
    
    implicitHeight: 44
    leftPadding: 20
    rightPadding: 20

    opacity: enabled ? 1.0 : 0.4
    Behavior on opacity {
        NumberAnimation { duration: MythMotion.fast; easing.type: Easing.OutCubic }
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
            font.family: MythTypography.uiFont
            font.pixelSize: MythTypography.bodyMedium
            font.weight: Font.DemiBold
            color: {
                if (control.variant === "primary") return MythColors.voidBlack
                if (control.variant === "danger" || control.variant === "ai" || control.variant === "success") return "#FFFFFF"
                return MythColors.textPrimary
            }
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    background: Rectangle {
        id: bgRect
        radius: MythSpacing.radiusMd
        border.width: (control.variant === "secondary" || control.variant === "ai" || control.variant === "success") ? 1 : 0
        border.color: {
            if (control.variant === "secondary") return MythColors.borderStrong
            if (control.variant === "ai") return MythColors.mythPurple
            if (control.variant === "success") return MythColors.success
            return "transparent"
        }

        color: {
            if (control.variant === "primary") {
                return control.pressed ? MythColors.cyanPressed : (control.hovered ? MythColors.cyanHover : MythColors.mythCyan)
            } else if (control.variant === "ai") {
                return control.pressed ? MythColors.purplePressed : (control.hovered ? MythColors.purpleHover : MythColors.mythPurple)
            } else if (control.variant === "secondary") {
                return control.pressed ? Qt.lighter(MythColors.elevated, 1.2) : (control.hovered ? MythColors.voidBlackHover : MythColors.elevated)
            } else if (control.variant === "danger") {
                return control.pressed ? Qt.darker(MythColors.error, 1.2) : (control.hovered ? Qt.lighter(MythColors.error, 1.1) : MythColors.error)
            } else if (control.variant === "success") {
                return control.pressed ? Qt.darker(MythColors.success, 1.2) : (control.hovered ? Qt.lighter(MythColors.success, 1.1) : MythColors.success)
            } else if (control.variant === "ghost") {
                return control.pressed ? MythColors.borderSubtle : (control.hovered ? MythColors.borderSubtle : "transparent")
            }
            return MythColors.mythCyan
        }

        Behavior on color {
            ColorAnimation { duration: MythMotion.fast; easing.type: Easing.OutCubic }
        }
        
        scale: control.pressed ? 0.98 : (control.hovered ? 1.02 : 1.0)
        Behavior on scale {
            NumberAnimation { duration: MythMotion.fast; easing.type: Easing.OutCubic }
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.NoButton
    }
}
