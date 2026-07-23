pragma Singleton
import QtQuick 6.0

QtObject {
    id: root

    readonly property string uiFont: "Inter"
    readonly property string codeFont: "JetBrains Mono"

    // Display Styles
    readonly property int displayXL: 64
    readonly property int displayLarge: 48
    readonly property int displayMedium: 40

    // Headings
    readonly property int h1: 32
    readonly property int h2: 24
    readonly property int h3: 20
    readonly property int h4: 18
    
    // Backwards compatibility aliases
    readonly property int h1Size: 32
    readonly property int h2Size: 24
    readonly property int h3Size: 20
    readonly property int bodySize: 14
    readonly property int captionSize: 12
    readonly property int labelSize: 12

    // Body
    readonly property int bodyLarge: 18
    readonly property int bodyMedium: 16
    readonly property int bodySmall: 14
    readonly property int body: 14

    // Labels
    readonly property int labelLarge: 16
    readonly property int labelMedium: 14
    readonly property int labelSmall: 12

    // Caption & Code
    readonly property int caption: 12
    readonly property int codeLarge: 16
    readonly property int codeMedium: 14
    readonly property int codeSmall: 12

    // Line Heights
    readonly property real h1Height: 1.25
    readonly property real h2Height: 1.33
    readonly property real h3Height: 1.40
    readonly property real bodyHeight: 1.50

    // Font Weights
    readonly property int weightRegular: Font.Normal
    readonly property int weightMedium: Font.Medium
    readonly property int weightSemiBold: Font.DemiBold
    readonly property int weightBold: Font.Bold
}
