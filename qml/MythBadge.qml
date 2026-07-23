import MythUI
import QtQuick 6.0

Rectangle {
    id: root

    property string text: "BADGE"
    property string variant: "active" // neutral, active, ai, success, warning, error, new, beta
    property string size: "medium"   // small, medium, large

    implicitWidth: badgeText.implicitWidth + horizontalPadding * 2
    implicitHeight: size === "small" ? 20 : (size === "large" ? 28 : 24)
    radius: MythSpacing.radiusPill

    property int horizontalPadding: size === "small" ? 8 : (size === "large" ? 14 : 10)

    color: {
        switch(variant) {
            case "active": return MythColors.cyanSubtle;
            case "ai": return MythColors.purpleSubtle;
            case "success": return MythColors.successSubtle;
            case "warning": return MythColors.warningSubtle;
            case "error": return MythColors.errorSubtle;
            case "new": return Qt.rgba(0, 0.898, 1, 0.2);
            case "beta": return Qt.rgba(0.545, 0.361, 1, 0.2);
            case "neutral":
            default:
                return MythColors.borderSubtle;
        }
    }

    border.width: 1
    border.color: {
        switch(variant) {
            case "active": return Qt.rgba(0, 0.898, 1, 0.3);
            case "ai": return Qt.rgba(0.545, 0.361, 1, 0.3);
            case "success": return Qt.rgba(0.133, 0.773, 0.369, 0.3);
            case "warning": return Qt.rgba(0.961, 0.62, 0.043, 0.3);
            case "error": return Qt.rgba(0.937, 0.267, 0.267, 0.3);
            case "neutral":
            default:
                return Qt.rgba(1, 1, 1, 0.12);
        }
    }

    Text {
        id: badgeText
        anchors.centerIn: parent
        text: root.text
        font.family: MythTypography.uiFont
        font.pixelSize: root.size === "small" ? 10 : (root.size === "large" ? 13 : 11)
        font.weight: Font.Medium
        font.capitalization: Font.AllUppercase
        color: {
            switch(root.variant) {
                case "active": return MythColors.mythCyan;
                case "ai": return MythColors.mythPurple;
                case "success": return MythColors.success;
                case "warning": return MythColors.warning;
                case "error": return MythColors.error;
                case "new": return MythColors.mythCyan;
                case "beta": return MythColors.mythPurple;
                case "neutral":
                default:
                    return MythColors.textSecondary;
            }
        }
    }
}
