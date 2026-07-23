import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import "../qml" as MythUI
import "../qml/theme" as Theme

Flickable {
    id: root
    contentWidth: width
    contentHeight: contentLayout.height + 100
    clip: true
    boundsBehavior: Flickable.StopAtBounds

    ColumnLayout {
        id: contentLayout
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 48
        spacing: 48

        // Header
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 8

            Text {
                text: "MythUI Component Library"
                font.family: "Inter"
                font.pixelSize: 32
                font.weight: Font.DemiBold
                color: "#F5F7FF"
            }
            Text {
                text: "v0.1 — Genesis Foundation"
                font.family: "Inter"
                font.pixelSize: 14
                color: "#9CA3AF"
            }
            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: Qt.rgba(1, 1, 1, 0.07)
                Layout.topMargin: 16
            }
        }

        // Section: Buttons
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 16

            Text {
                text: "Buttons"
                font.family: "Inter"
                font.pixelSize: 24
                color: "#F5F7FF"
            }

            RowLayout {
                spacing: 16
                MythUI.MythButton { text: "Primary Action"; variant: "primary" }
                MythUI.MythButton { text: "Secondary"; variant: "secondary" }
                MythUI.MythButton { text: "Ghost"; variant: "ghost" }
                MythUI.MythButton { text: "Delete"; variant: "danger" }
                MythUI.MythButton { text: "Disabled"; enabled: false }
            }
        }

        // Section: Cards
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 16

            Text {
                text: "Cards"
                font.family: "Inter"
                font.pixelSize: 24
                color: "#F5F7FF"
            }

            RowLayout {
                spacing: 16
                Layout.fillWidth: true
                
                MythUI.MythCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 150
                    cardTitle: "System Monitoring"
                    Text {
                        text: "CPU: 34%\nRAM: 8.2 / 32 GB\nGPU Temp: 45°C"
                        color: "#9CA3AF"
                        font.family: "JetBrains Mono"
                        anchors.centerIn: parent
                    }
                }
                
                MythUI.MythCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 150
                    Text {
                        text: "Glass Surface Container"
                        color: "#F5F7FF"
                        font.family: "Inter"
                        anchors.centerIn: parent
                    }
                }
            }
        }

        // Section: Text Fields
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 16

            Text {
                text: "Text Fields"
                font.family: "Inter"
                font.pixelSize: 24
                color: "#F5F7FF"
            }

            ColumnLayout {
                spacing: 16
                Layout.fillWidth: true
                MythUI.MythTextField { Layout.fillWidth: true; labelText: "Username"; placeholderText: "Enter username..." }
                MythUI.MythTextField { Layout.fillWidth: true; labelText: "Password"; placeholderText: "Enter password..."; echoMode: TextInput.Password }
                MythUI.MythTextField { Layout.fillWidth: true; placeholderText: "Search command or setting..." }
            }
        }

        // Section: Toggles
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 16

            Text {
                text: "Toggles"
                font.family: "Inter"
                font.pixelSize: 24
                color: "#F5F7FF"
            }

            ColumnLayout {
                spacing: 16
                MythUI.MythToggle { labelText: "Dark Mode"; checked: true }
                MythUI.MythToggle { labelText: "Desktop Notifications"; checked: true }
                MythUI.MythToggle { labelText: "AI Neural Engine Assistance" }
            }
        }

        // Section: Sliders
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 16

            Text {
                text: "Sliders"
                font.family: "Inter"
                font.pixelSize: 24
                color: "#F5F7FF"
            }

            ColumnLayout {
                spacing: 16
                Layout.fillWidth: true
                MythUI.MythSlider { Layout.fillWidth: true; showValue: true; value: 0.75; from: 0.0; to: 1.0 }
                MythUI.MythSlider { Layout.fillWidth: true; showValue: true; value: 40; from: 0; to: 100; stepSize: 1 }
            }
        }

        // Section: Progress
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 16

            Text {
                text: "Progress Bars"
                font.family: "Inter"
                font.pixelSize: 24
                color: "#F5F7FF"
            }

            ColumnLayout {
                spacing: 16
                Layout.fillWidth: true
                MythUI.MythProgressBar { Layout.fillWidth: true; value: 0.65; showLabel: true }
                MythUI.MythProgressBar { Layout.fillWidth: true; indeterminate: true }
            }
        }

        // Section: Dialog
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 16

            Text {
                text: "Dialog & Overlay"
                font.family: "Inter"
                font.pixelSize: 24
                color: "#F5F7FF"
            }
            
            RowLayout {
                spacing: 16
                MythUI.MythButton { 
                    text: "Open Standard Dialog"
                    variant: "primary"
                    onClicked: standardDialog.open()
                }
                MythUI.MythButton { 
                    text: "Open Danger Dialog"
                    variant: "danger"
                    onClicked: dangerDialog.open()
                }
            }
        }

        // Section: Notification Toast
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 16

            Text {
                text: "Notification Toasts"
                font.family: "Inter"
                font.pixelSize: 24
                color: "#F5F7FF"
            }

            RowLayout {
                spacing: 16
                MythUI.MythButton { 
                    text: "Info Toast"
                    variant: "secondary"
                    onClicked: {
                        activeToast.type = "info";
                        activeToast.message = "MythOS Genesis update available (v0.1.2)";
                        activeToast.show();
                    }
                }
                MythUI.MythButton { 
                    text: "Success Toast"
                    variant: "secondary"
                    onClicked: {
                        activeToast.type = "success";
                        activeToast.message = "System configuration saved successfully.";
                        activeToast.show();
                    }
                }
                MythUI.MythButton { 
                    text: "Warning Toast"
                    variant: "secondary"
                    onClicked: {
                        activeToast.type = "warning";
                        activeToast.message = "High CPU memory load detected in Myth Shell.";
                        activeToast.show();
                    }
                }
                MythUI.MythButton { 
                    text: "Error Toast"
                    variant: "danger"
                    onClicked: {
                        activeToast.type = "error";
                        activeToast.message = "Failed to communicate with Myth Daemon.";
                        activeToast.show();
                    }
                }
            }
        }
    }

    // Dialog overlays
    MythUI.MythDialog {
        id: standardDialog
        dialogTitle: "Initialize Protocol"
        message: "Are you sure you want to initialize the MythOS kernel setup? This will configure default workspace parameters."
        confirmText: "Initialize"
        cancelText: "Cancel"
        onConfirmed: console.log("Standard Dialog Confirmed")
    }

    MythUI.MythDialog {
        id: dangerDialog
        dialogTitle: "Purge System Cache"
        message: "This will permanently remove all cached package metadata and temporary build artifacts."
        variant: "danger"
        confirmText: "Purge Data"
        cancelText: "Keep Cache"
        onConfirmed: console.log("Danger Dialog Confirmed")
    }

    // Notification toast overlay
    MythUI.MythNotification {
        id: activeToast
    }
}
