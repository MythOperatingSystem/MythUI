pragma Singleton
import QtQuick 6.0

QtObject {
    id: root

    readonly property int xs: 4
    readonly property int sm: 8
    readonly property int md: 16
    readonly property int lg: 24
    readonly property int xl: 32
    readonly property int xxl: 48
    
    readonly property int radiusSm: 8
    readonly property int radiusMd: 12
    readonly property int radiusLg: 16
    readonly property int radiusXl: 24
    readonly property int radiusFull: 9999
    
    readonly property int shadowSmOffsetY: 2
    readonly property int shadowSmBlur: 8
    readonly property color shadowSmColor: Qt.rgba(0, 0, 0, 0.3)
    
    readonly property int shadowMdOffsetY: 4
    readonly property int shadowMdBlur: 16
    readonly property color shadowMdColor: Qt.rgba(0, 0, 0, 0.4)
    
    readonly property int shadowLgOffsetY: 8
    readonly property int shadowLgBlur: 32
    readonly property color shadowLgColor: Qt.rgba(0, 0, 0, 0.5)
}
