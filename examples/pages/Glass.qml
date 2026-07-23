import QtQuick
import QtQuick.Controls
import MythUI 1.0

Pane {
    property int padding: 0
    topPadding: padding
    bottomPadding: padding
    leftPadding: padding
    rightPadding: padding
    
    background: Rectangle {
        color: MythColors.surface ? MythColors.surface : "#171A24"
        border.color: MythColors.borderSubtle
        border.width: 1
        radius: 12
    }
}
