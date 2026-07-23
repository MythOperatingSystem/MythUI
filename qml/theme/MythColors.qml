pragma Singleton
import QtQuick 6.0

QtObject {
    id: root

    readonly property color voidBlack: "#0D0E15"
    readonly property color surface: "#12141D"
    readonly property color elevated: "#171A24"
    readonly property color overlay: "#1E2130"
    
    readonly property color mythCyan: "#00E5FF"
    readonly property color mythCyanDim: "#00B8D4"
    readonly property color mythCyanGlow: Qt.rgba(0, 0.898, 1, 0.15)
    
    readonly property color mythPurple: "#8B5CFF"
    readonly property color mythPurpleDim: "#7C4DFF"
    readonly property color mythPurpleGlow: Qt.rgba(0.545, 0.361, 1, 0.15)
    
    readonly property color textPrimary: "#F5F7FF"
    readonly property color textSecondary: "#9CA3AF"
    readonly property color textDisabled: "#4B5563"
    readonly property color textInverse: "#0D0E15"
    
    readonly property color success: "#10B981"
    readonly property color successDim: "#059669"
    readonly property color warning: "#F59E0B"
    readonly property color warningDim: "#D97706"
    readonly property color error: "#EF4444"
    readonly property color errorDim: "#DC2626"
    
    readonly property color borderSubtle: Qt.rgba(1, 1, 1, 0.07)
    readonly property color borderMedium: Qt.rgba(1, 1, 1, 0.12)
    readonly property color borderFocus: "#00E5FF"
    
    readonly property color buttonPrimary: "#00E5FF"
    readonly property color buttonPrimaryHover: "#00D4ED"
    readonly property color buttonPrimaryPressed: "#00BCD4"
    
    readonly property color buttonSecondary: "#171A24"
    readonly property color buttonSecondaryHover: "#1E2130"
    
    readonly property color buttonGhost: "transparent"
    readonly property color buttonGhostHover: Qt.rgba(1, 1, 1, 0.05)
    
    readonly property color buttonDanger: "#EF4444"
    readonly property color buttonDangerHover: "#DC2626"
}
