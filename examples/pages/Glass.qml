import QtQuick
import QtQuick.Controls
import MythUI 1.0

Pane {
    padding: 0
    
    background: Rectangle {
        color: MythColors.surface ? MythColors.surface : "#171A24"
        border.color: MythColors.borderSubtle
        border.width: 1
        radius: 12
    }
}
