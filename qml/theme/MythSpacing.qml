pragma Singleton
import QtQuick 6.0

QtObject {
    id: root

    // Grid Spacing
    readonly property int sp2: 2
    readonly property int sp4: 4
    readonly property int sp8: 8
    readonly property int sp12: 12
    readonly property int sp16: 16
    readonly property int sp20: 20
    readonly property int sp24: 24
    readonly property int sp32: 32
    readonly property int sp40: 40
    readonly property int sp48: 48
    readonly property int sp64: 64

    // Backwards compatibility aliases
    readonly property int xs: 4
    readonly property int sm: 8
    readonly property int md: 16
    readonly property int lg: 24
    readonly property int xl: 32
    readonly property int xxl: 48

    // Radius Scale
    readonly property int radiusXs: 4
    readonly property int radiusSm: 8
    readonly property int radiusMd: 12
    readonly property int radiusLg: 16
    readonly property int radiusXl: 24
    readonly property int radiusWindow: 28
    readonly property int radiusFull: 9999
    readonly property int radiusPill: 9999

    // Elevation Shadows
    readonly property int shadowSmOffsetY: 2
    readonly property int shadowSmBlur: 8
    readonly property color shadowSmColor: Qt.rgba(0, 0, 0, 0.3)

    readonly property int shadowMdOffsetY: 4
    readonly property int shadowMdBlur: 16
    readonly property color shadowMdColor: Qt.rgba(0, 0, 0, 0.4)

    readonly property int shadowLgOffsetY: 8
    readonly property int shadowLgBlur: 32
    readonly property color shadowLgColor: Qt.rgba(0, 0, 0, 0.5)

    // Blur Levels
    readonly property int blurSm: 8
    readonly property int blurMd: 16
    readonly property int blurLg: 24
    readonly property int blurOverlay: 36
}
