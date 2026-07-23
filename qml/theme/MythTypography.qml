pragma Singleton
import QtQuick 6.0

QtObject {
    id: root

    readonly property string uiFont: "Inter"
    readonly property string codeFont: "JetBrains Mono"
    
    readonly property int h1Size: 32
    readonly property int h2Size: 24
    readonly property int h3Size: 18
    readonly property int bodySize: 14
    readonly property int captionSize: 12
    readonly property int labelSize: 11
    
    readonly property real h1Height: 1.2
    readonly property real h2Height: 1.3
    readonly property real h3Height: 1.4
    readonly property real bodyHeight: 1.5
    
    readonly property int weightRegular: Font.Normal
    readonly property int weightMedium: Font.Medium
    readonly property int weightSemiBold: Font.DemiBold
    readonly property int weightBold: Font.Bold
}
