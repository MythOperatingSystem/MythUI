pragma Singleton
import QtQuick 6.0

QtObject {
    id: root

    // Base Surfaces
    readonly property color voidBlack: "#0D0E15"
    readonly property color voidBlackElevated: "#12141D"
    readonly property color voidBlackSurface: "#171A24"
    readonly property color voidBlackHover: "#1D2130"
    
    // Alias surface properties
    readonly property color surface: "#12141D"
    readonly property color elevated: "#171A24"
    readonly property color overlay: "#1D2130"

    // Primary Accent (Myth Cyan)
    readonly property color mythCyan: "#00E5FF"
    readonly property color cyanHover: "#33EBFF"
    readonly property color cyanPressed: "#00B8CC"
    readonly property color cyanSubtle: Qt.rgba(0, 0.898, 1, 0.12)
    readonly property color mythCyanDim: "#00B8D4"
    readonly property color mythCyanGlow: Qt.rgba(0, 0.898, 1, 0.15)

    // AI Accent (Myth Purple)
    readonly property color mythPurple: "#8B5CFF"
    readonly property color purpleHover: "#A17DFF"
    readonly property color purplePressed: "#7042E6"
    readonly property color purpleSubtle: Qt.rgba(0.545, 0.361, 1, 0.14)
    readonly property color mythPurpleDim: "#7C4DFF"
    readonly property color mythPurpleGlow: Qt.rgba(0.545, 0.361, 1, 0.15)

    // Text Tiers
    readonly property color textPrimary: "#F5F7FF"
    readonly property color textSecondary: "#9CA3AF"
    readonly property color textMuted: "#697181"
    readonly property color textDisabled: "#464D5C"
    readonly property color textInverse: "#0D0E15"

    // Semantic Colors
    readonly property color success: "#22C55E"
    readonly property color successSubtle: Qt.rgba(0.133, 0.773, 0.369, 0.14)
    readonly property color warning: "#F59E0B"
    readonly property color warningSubtle: Qt.rgba(0.961, 0.62, 0.043, 0.14)
    readonly property color error: "#EF4444"
    readonly property color errorSubtle: Qt.rgba(0.937, 0.267, 0.267, 0.14)

    // Borders
    readonly property color borderSubtle: Qt.rgba(1, 1, 1, 0.08)
    readonly property color borderStrong: Qt.rgba(1, 1, 1, 0.16)
    readonly property color borderFocus: "#00E5FF"

    // Button States
    readonly property color buttonPrimary: "#00E5FF"
    readonly property color buttonPrimaryHover: "#33EBFF"
    readonly property color buttonPrimaryPressed: "#00B8CC"
    readonly property color buttonSecondary: "#171A24"
    readonly property color buttonSecondaryHover: "#1D2130"
    readonly property color buttonGhost: "transparent"
    readonly property color buttonGhostHover: Qt.rgba(1, 1, 1, 0.05)
    readonly property color buttonDanger: "#EF4444"
    readonly property color buttonDangerHover: "#DC2626"
}
