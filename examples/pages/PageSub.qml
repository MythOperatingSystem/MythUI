import QtQuick
import MythUI 1.0

Text {
    property string text: ""
    color: MythColors.textSecondary
    font.pixelSize: MythTypography.body
    wrapMode: Text.WordWrap
    Layout.maximumWidth: 600
}
