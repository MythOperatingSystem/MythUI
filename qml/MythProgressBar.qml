import QtQuick 6.0
import "theme" as Theme

Item {
    id: root
    width: 200
    height: showLabel ? barHeight + 20 : barHeight
    
    property real value: 0.0
    property bool indeterminate: false
    property int barHeight: 4
    property bool showLabel: false
    property color accentColor: Theme.MythColors.mythCyan

    // Track
    Rectangle {
        id: track
        width: parent.width
        height: root.barHeight
        radius: root.barHeight / 2
        color: Theme.MythColors.overlay
        anchors.top: parent.top
        clip: true

        // Determinate Bar
        Rectangle {
            id: determinateBar
            visible: !root.indeterminate
            height: parent.height
            radius: root.barHeight / 2
            color: root.accentColor
            anchors.left: parent.left
            width: Math.max(0, Math.min(root.value, 1.0)) * parent.width
            
            // Leading edge subtle glow
            Rectangle {
                width: 10
                height: parent.height
                anchors.right: parent.right
                color: Qt.lighter(root.accentColor, 1.3)
                radius: root.barHeight / 2
                opacity: root.value > 0.02 && root.value < 0.98 ? 0.6 : 0.0
            }

            Behavior on width { NumberAnimation { duration: Theme.MythMotion.standard; easing.type: Easing.OutCubic } }
        }

        // Indeterminate Bar
        Rectangle {
            id: indeterminateBar
            visible: root.indeterminate
            height: parent.height
            radius: root.barHeight / 2
            color: root.accentColor
            width: parent.width * 0.4
            
            SequentialAnimation on x {
                id: indetAnim
                running: root.indeterminate && root.visible
                loops: Animation.Infinite
                NumberAnimation {
                    from: -indeterminateBar.width
                    to: track.width
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    // Label
    Text {
        visible: root.showLabel && !root.indeterminate
        text: Math.round(Math.max(0, Math.min(root.value, 1.0)) * 100) + "%"
        color: Theme.MythColors.textSecondary
        font.family: Theme.MythTypography.uiFont
        font.pixelSize: Theme.MythTypography.caption
        anchors.top: track.bottom
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
