import QtQuick 6.0
import QtQuick.Controls 6.0
import "theme" as Theme

Item {
    id: root
    width: 200
    height: 32 // including value label space
    opacity: enabled ? 1.0 : 0.4

    property real value: 0.5
    property real from: 0.0
    property real to: 1.0
    property real stepSize: 0.0
    property bool showValue: false
    property bool enabled: true

    signal valueChanged(real value)

    onValueChanged: {
        if (root.value < from) root.value = from;
        if (root.value > to) root.value = to;
    }

    Item {
        id: trackArea
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter

        // Background track
        Rectangle {
            id: backgroundTrack
            width: parent.width
            height: 4
            radius: 2
            color: Theme.MythColors.overlay
            anchors.verticalCenter: parent.verticalCenter
        }

        // Filled track
        Rectangle {
            id: filledTrack
            height: 4
            radius: 2
            color: Theme.MythColors.mythCyan
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            width: Math.max(0, (root.value - root.from) / (root.to - root.from) * parent.width)
        }

        // Thumb
        Rectangle {
            id: thumb
            width: 18
            height: 18
            radius: 9
            color: Theme.MythColors.mythCyan
            anchors.verticalCenter: parent.verticalCenter
            x: filledTrack.width - width / 2
            
            // Glow effect on hover
            Rectangle {
                anchors.centerIn: parent
                width: parent.width + 12
                height: parent.height + 12
                radius: width / 2
                color: Theme.MythColors.mythCyan
                opacity: mouseArea.containsMouse && !mouseArea.pressed ? 0.2 : 0.0
                Behavior on opacity { NumberAnimation { duration: Theme.MythMotion.fast } }
            }
            
            // Shadows and scaling
            scale: mouseArea.pressed ? 1.1 : (mouseArea.containsMouse ? 1.2 : 1.0)
            Behavior on scale { NumberAnimation { duration: Theme.MythMotion.fast; easing.type: Easing.OutCubic } }
        }

        // Value Label
        Text {
            visible: root.showValue
            text: Number(root.value).toLocaleString(Qt.locale(), 'f', root.stepSize === 0 ? 2 : (root.stepSize < 0.1 ? 2 : (root.stepSize < 1 ? 1 : 0)))
            color: Theme.MythColors.textSecondary
            font.family: Theme.MythTypography.uiFont
            font.pixelSize: Theme.MythTypography.caption
            anchors.bottom: thumb.top
            anchors.bottomMargin: 4
            anchors.horizontalCenter: thumb.horizontalCenter
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: root.enabled
            enabled: root.enabled
            
            preventStealing: true

            function updateValueFromMouse(mouse) {
                var normalizedX = Math.max(0, Math.min(mouse.x, backgroundTrack.width));
                var percentage = normalizedX / backgroundTrack.width;
                var rawValue = root.from + percentage * (root.to - root.from);
                
                var finalValue = rawValue;
                if (root.stepSize > 0) {
                    finalValue = Math.round((rawValue - root.from) / root.stepSize) * root.stepSize + root.from;
                }
                
                // Clamp
                finalValue = Math.max(root.from, Math.min(root.to, finalValue));
                
                if (root.value !== finalValue) {
                    root.value = finalValue;
                    root.valueChanged(root.value);
                }
            }

            onPressed: (mouse) => {
                updateValueFromMouse(mouse);
            }
            
            onPositionChanged: (mouse) => {
                if (pressed) {
                    updateValueFromMouse(mouse);
                }
            }
        }
    }
}
