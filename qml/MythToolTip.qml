import QtQuick 6.0
import QtQuick.Layouts 6.0
import "theme" as Theme

Item {
    id: root
    
    // Implicit size based on content
    implicitWidth: tooltipContainer.width
    implicitHeight: tooltipContainer.height
    
    property string text: ""
    property bool showToolTip: false
    property string position: "top" // "top", "bottom", "left", "right"
    
    visible: opacity > 0 || entranceAnim.running
    opacity: 0
    
    z: 1000 // Tooltips should be on top
    
    onShowToolTipChanged: {
        if (showToolTip) {
            startShow();
        } else {
            startHide();
        }
    }
    
    function startShow() {
        if (position === "top") tooltipContainer.y = 2;
        else if (position === "bottom") tooltipContainer.y = -2;
        else if (position === "left") tooltipContainer.x = 2;
        else if (position === "right") tooltipContainer.x = -2;
        
        entranceAnim.start();
    }
    
    function startHide() {
        exitAnim.start();
    }
    
    ParallelAnimation {
        id: entranceAnim
        NumberAnimation {
            target: root
            property: "opacity"
            to: 1
            duration: Theme.MythMotion.fast
            easing.type: Easing.OutCubic
        }
        NumberAnimation {
            target: tooltipContainer
            property: "y"
            to: 0
            duration: Theme.MythMotion.fast
            easing.type: Easing.OutCubic
            // Only affect y if position is top/bottom
        }
        NumberAnimation {
            target: tooltipContainer
            property: "x"
            to: 0
            duration: Theme.MythMotion.fast
            easing.type: Easing.OutCubic
            // Only affect x if position is left/right
        }
    }
    
    NumberAnimation {
        id: exitAnim
        target: root
        property: "opacity"
        to: 0
        duration: 100
        easing.type: Easing.Linear
    }
    
    Rectangle {
        id: tooltipContainer
        width: Math.min(240, contentText.implicitWidth + 16)
        height: contentText.implicitHeight + 12
        color: Theme.MythColors.overlay
        radius: 8 // radiusSm
        border.color: Theme.MythColors.borderSubtle
        border.width: 1
        
        // Subtle shadow emulation
        Rectangle {
            anchors.fill: parent
            anchors.margins: -1
            color: "transparent"
            border.color: Qt.rgba(0, 0, 0, 0.2)
            border.width: 1
            radius: 8
            z: -1
        }
        
        Text {
            id: contentText
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            anchors.topMargin: 6
            anchors.bottomMargin: 6
            text: root.text
            color: Theme.MythColors.textPrimary
            font.family: Theme.MythTypography.uiFont
            font.pixelSize: Theme.MythTypography.caption
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
