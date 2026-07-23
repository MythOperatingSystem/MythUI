import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0
import "theme" as Theme

Item {
    id: root
    anchors.fill: parent
    visible: false
    z: 999 // Ensure dialogs are on top

    property string dialogTitle: "Dialog"
    property string message: ""
    property string confirmText: "Confirm"
    property string cancelText: "Cancel"
    property bool showCancel: true
    property string variant: "default" // "default", "danger"
    property bool closeOnBackdropClick: true

    signal confirmed()
    signal cancelled()
    signal closed()

    function open() {
        root.visible = true;
        dialogCard.scale = 0.95;
        dialogCard.opacity = 0.0;
        backdrop.opacity = 0.0;
        entranceAnim.start();
    }

    function close() {
        exitAnim.start();
    }

    ParallelAnimation {
        id: entranceAnim
        NumberAnimation {
            target: backdrop
            property: "opacity"
            to: 1.0
            duration: Theme.MythMotion.entrance
            easing.type: Easing.OutCubic
        }
        NumberAnimation {
            target: dialogCard
            property: "opacity"
            to: 1.0
            duration: Theme.MythMotion.entrance
            easing.type: Easing.OutCubic
        }
        NumberAnimation {
            target: dialogCard
            property: "scale"
            to: 1.0
            duration: Theme.MythMotion.entrance
            easing.type: Easing.OutCubic
        }
    }

    ParallelAnimation {
        id: exitAnim
        NumberAnimation {
            target: backdrop
            property: "opacity"
            to: 0.0
            duration: 200
            easing.type: Easing.OutCubic
        }
        NumberAnimation {
            target: dialogCard
            property: "opacity"
            to: 0.0
            duration: 200
            easing.type: Easing.OutCubic
        }
        NumberAnimation {
            target: dialogCard
            property: "scale"
            to: 0.95
            duration: 200
            easing.type: Easing.OutCubic
        }
        onFinished: {
            root.visible = false;
            root.closed();
        }
    }

    Rectangle {
        id: backdrop
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.6)
        opacity: 0

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (root.closeOnBackdropClick) {
                    root.close();
                }
            }
        }
    }

    Rectangle {
        id: dialogCard
        width: 420
        height: contentLayout.implicitHeight + Theme.MythSpacing.xl * 2
        anchors.centerIn: parent
        color: Theme.MythColors.elevated
        radius: 24 // radiusXl
        border.color: Theme.MythColors.borderSubtle
        border.width: 1
        opacity: 0
        scale: 0.95

        ColumnLayout {
            id: contentLayout
            anchors.fill: parent
            anchors.margins: 0
            spacing: 0

            Item {
                Layout.fillWidth: true
                Layout.topMargin: 32
                Layout.leftMargin: Theme.MythSpacing.lg
                Layout.rightMargin: Theme.MythSpacing.lg
                implicitHeight: titleText.implicitHeight
                
                Text {
                    id: titleText
                    anchors.fill: parent
                    text: root.dialogTitle
                    color: Theme.MythColors.textPrimary
                    font.family: Theme.MythTypography.uiFont
                    font.pixelSize: Theme.MythTypography.h3
                    font.bold: true
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.topMargin: 16
                Layout.leftMargin: Theme.MythSpacing.lg
                Layout.rightMargin: Theme.MythSpacing.lg
                implicitHeight: messageText.implicitHeight
                
                Text {
                    id: messageText
                    anchors.fill: parent
                    text: root.message
                    color: Theme.MythColors.textSecondary
                    font.family: Theme.MythTypography.uiFont
                    font.pixelSize: Theme.MythTypography.body
                    wrapMode: Text.WordWrap
                }
            }

            Item {
                Layout.fillHeight: true
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: Theme.MythSpacing.xl
                Layout.bottomMargin: 24
                Layout.leftMargin: Theme.MythSpacing.lg
                Layout.rightMargin: Theme.MythSpacing.lg
                spacing: 12
                Layout.alignment: Qt.AlignRight

                Item {
                    Layout.fillWidth: true
                }

                // Cancel Button (Ghost style)
                Rectangle {
                    visible: root.showCancel
                    implicitWidth: cancelTextItem.implicitWidth + 32
                    implicitHeight: 40
                    color: cancelMouseArea.containsMouse ? Theme.MythColors.overlay : "transparent"
                    radius: 12
                    border.width: cancelMouseArea.containsMouse ? 1 : 0
                    border.color: Theme.MythColors.borderSubtle

                    Text {
                        id: cancelTextItem
                        anchors.centerIn: parent
                        text: root.cancelText
                        color: Theme.MythColors.textSecondary
                        font.family: Theme.MythTypography.uiFont
                        font.pixelSize: Theme.MythTypography.body
                        font.bold: true
                    }

                    MouseArea {
                        id: cancelMouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            root.cancelled();
                            root.close();
                        }
                    }

                    Behavior on color { ColorAnimation { duration: Theme.MythMotion.fast } }
                }

                // Confirm Button (Primary / Danger)
                Rectangle {
                    implicitWidth: confirmTextItem.implicitWidth + 32
                    implicitHeight: 40
                    color: root.variant === "danger" 
                           ? Theme.MythColors.error 
                           : (confirmMouseArea.containsMouse ? Qt.lighter(Theme.MythColors.mythCyan, 1.1) : Theme.MythColors.mythCyan)
                    radius: 12

                    Text {
                        id: confirmTextItem
                        anchors.centerIn: parent
                        text: root.confirmText
                        color: root.variant === "danger" ? Theme.MythColors.textPrimary : Theme.MythColors.voidBlack
                        font.family: Theme.MythTypography.uiFont
                        font.pixelSize: Theme.MythTypography.body
                        font.bold: true
                    }

                    MouseArea {
                        id: confirmMouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            root.confirmed();
                            root.close();
                        }
                    }

                    Behavior on color { ColorAnimation { duration: Theme.MythMotion.fast } }
                }
            }
        }
    }
}
