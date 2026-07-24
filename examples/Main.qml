import QtQuick 6.0
import QtQuick.Window 6.0
import MythUI 1.0

Window {
    id: root
    visible: true
    width: 1280
    height: 860
    title: "MythUI Component Showcase"
    color: MythColors.voidBlack

    DesktopShell {
        anchors.fill: parent
    }
}
