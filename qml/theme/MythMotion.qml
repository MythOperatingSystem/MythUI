pragma Singleton
import QtQuick 6.0

QtObject {
    id: root

    readonly property int fast: 150
    readonly property int standard: 250
    readonly property int slow: 400
    readonly property int entrance: 300
    readonly property int exit: 200
    
    readonly property int easingType: Easing.OutCubic
    readonly property int easingDecelerate: Easing.OutQuart
    readonly property int easingAccelerate: Easing.InCubic
    readonly property int easingBounce: Easing.OutBack
}
