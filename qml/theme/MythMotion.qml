pragma Singleton
import QtQuick 6.0

QtObject {
    id: root

    readonly property int instant: 80
    readonly property int fast: 150
    readonly property int standard: 200
    readonly property int emphasized: 250
    readonly property int slow: 350

    readonly property int entrance: 250
    readonly property int exit: 150
    
    readonly property int easingType: Easing.OutCubic
    readonly property int easingDecelerate: Easing.OutQuart
    readonly property int easingAccelerate: Easing.InCubic
    readonly property int easingBounce: Easing.OutBack
}
