import QtQuick
import QtQuick.Layouts
import MythUI 1.0

RowLayout {
    property string num: "00"
    property string label: ""
    spacing: 8
    
    Rectangle {
        width: 24
        height: 24
        radius: 4
        color: "transparent"
        border.color: MythColors.borderSubtle
        
        Text {
            anchors.centerIn: parent
            text: num
            color: MythColors.cyan
            font: MythTypography.mono
            font.pixelSize: 11
        }
    }
    
    Text {
        text: label
        color: MythColors.cyan
        font: MythTypography.label
    }
}
