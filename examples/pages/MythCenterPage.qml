import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    property string currentSection: "Appearance"

    ListModel {
        id: sectionsModel
        ListElement { name: "Overview" }
        ListElement { name: "Appearance" }
        ListElement { name: "Displays" }
        ListElement { name: "Sound" }
        ListElement { name: "Network" }
        ListElement { name: "Security" }
        ListElement { name: "Privacy" }
        ListElement { name: "AI" }
        ListElement { name: "Updates" }
        ListElement { name: "About" }
    }

    Component {
        id: toggleComp
        Rectangle {
            id: toggleRect
            width: 40
            height: 22
            radius: 11
            property bool isOn: itemVal
            color: isOn ? itemColor : Qt.rgba(255, 255, 255, 0.1)
            
            Rectangle {
                y: 3
                x: toggleRect.isOn ? 21 : 3
                width: 16
                height: 16
                radius: 8
                color: "white"
                
                Behavior on x {
                    NumberAnimation { duration: 150 }
                }
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: toggleRect.isOn = !toggleRect.isOn
            }
        }
    }

    Component {
        id: selectComp
        Rectangle {
            height: 28
            width: selectText.implicitWidth + 24
            radius: 8
            color: Qt.rgba(255, 255, 255, 0.06)
            border.color: MythColors.borderSubtle
            border.width: 1
            
            Text {
                id: selectText
                anchors.centerIn: parent
                text: itemVal
                color: MythColors.textSecondary
                font.pixelSize: 13
                font.family: MythTypography.baseFontFamily
            }
        }
    }

    Component {
        id: colorComp
        Rectangle {
            width: 28
            height: 28
            radius: 8
            color: itemVal
            border.color: Qt.rgba(itemVal.r, itemVal.g, itemVal.b, 0.5)
            border.width: 2
        }
    }

    Component {
        id: badgeComp
        Rectangle {
            height: 24
            width: badgeText.implicitWidth + 16
            radius: 12
            color: Qt.rgba(itemColor.r, itemColor.g, itemColor.b, 0.15)
            
            Text {
                id: badgeText
                anchors.centerIn: parent
                text: itemVal
                color: itemColor
                font.pixelSize: 12
                font.weight: Font.Medium
                font.family: MythTypography.baseFontFamily
            }
        }
    }

    Component {
        id: appearanceComponent
        ColumnLayout {
            spacing: 12
            
            Repeater {
                model: [
                    { label: "Theme Intensity", sub: "Controls glow and blur strength", type: "select", val: "Standard" },
                    { label: "Transparency", sub: "Enable glass surface blur effects", type: "toggle", val: true },
                    { label: "Animations", sub: "System motion speed", type: "select", val: "Standard (200ms)" },
                    { label: "Accent Color", sub: "Active element highlight", type: "color", val: MythColors.mythCyan },
                    { label: "Font Scale", sub: "Base UI text size", type: "select", val: "100%" }
                ]
                delegate: Item {
                    Layout.fillWidth: true
                    implicitHeight: 56
                    
                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: MythColors.borderSubtle
                    }

                    RowLayout {
                        anchors.fill: parent
                        anchors.bottomMargin: 1
                        
                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2
                            Text {
                                text: modelData.label
                                font.pixelSize: 14
                                font.weight: Font.Medium
                                color: MythColors.textPrimary
                                font.family: MythTypography.baseFontFamily
                            }
                            Text {
                                text: modelData.sub
                                font.pixelSize: 12
                                color: MythColors.textSecondary
                                font.family: MythTypography.baseFontFamily
                            }
                        }

                        Loader {
                            sourceComponent: {
                                if (modelData.type === "toggle") return toggleComp;
                                if (modelData.type === "select") return selectComp;
                                if (modelData.type === "color") return colorComp;
                                return null;
                            }
                            property var itemVal: modelData.val
                            property string itemLabel: modelData.label
                            property var itemColor: MythColors.mythCyan
                        }
                    }
                }
            }
            Item { Layout.fillHeight: true }
        }
    }

    Component {
        id: aiComponent
        ColumnLayout {
            spacing: 12
            
            Repeater {
                model: [
                    { label: "AI Enabled", sub: "System-wide AI capabilities", type: "toggle", val: true, color: MythColors.mythPurple },
                    { label: "Processing Mode", sub: "Local AI only. No data leaves your device.", type: "badge", val: "Local Only", color: MythColors.mythPurple },
                    { label: "Command Execution", sub: "AI must request confirmation before executing commands", type: "toggle", val: true, color: MythColors.mythPurple },
                    { label: "Context Access", sub: "AI can read active window context", type: "toggle", val: false, color: MythColors.mythPurple },
                    { label: "AI History", sub: "Store AI interaction history locally", type: "toggle", val: true, color: MythColors.mythPurple }
                ]
                delegate: Item {
                    Layout.fillWidth: true
                    implicitHeight: 56
                    
                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: MythColors.borderSubtle
                    }

                    RowLayout {
                        anchors.fill: parent
                        anchors.bottomMargin: 1
                        
                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2
                            Text {
                                text: modelData.label
                                font.pixelSize: 14
                                font.weight: Font.Medium
                                color: MythColors.textPrimary
                                font.family: MythTypography.baseFontFamily
                            }
                            Text {
                                text: modelData.sub
                                font.pixelSize: 12
                                color: MythColors.textSecondary
                                font.family: MythTypography.baseFontFamily
                            }
                        }

                        Loader {
                            sourceComponent: {
                                if (modelData.type === "toggle") return toggleComp;
                                if (modelData.type === "badge") return badgeComp;
                                return null;
                            }
                            property var itemVal: modelData.val
                            property string itemLabel: modelData.label
                            property var itemColor: modelData.color
                        }
                    }
                }
            }
            Item { Layout.fillHeight: true }
        }
    }

    Component {
        id: fallbackComponent
        Item {
            Text {
                text: root.currentSection + " settings panel — detailed controls."
                color: MythColors.textSecondary
                font.pixelSize: 14
                font.family: MythTypography.baseFontFamily
            }
        }
    }

    ScrollView {
        clip: true
        anchors.fill: parent
        contentWidth: availableWidth

        Item {
            width: parent.width
            implicitHeight: mainLayout.implicitHeight + 80

            ColumnLayout {
                id: mainLayout
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 40
                spacing: 24

                // PageBadge
                Rectangle {
                    color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.15)
                    radius: 6
                    width: badgeRow.implicitWidth + 16
                    height: 24
                    Row {
                        id: badgeRow
                        anchors.centerIn: parent
                        spacing: 8
                        Text {
                            text: "20"
                            color: MythColors.mythCyan
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            font.family: MythTypography.baseFontFamily
                        }
                        Text {
                            text: "Myth Center"
                            color: MythColors.mythCyan
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            font.family: MythTypography.baseFontFamily
                        }
                    }
                }

                // PageH1
                Text {
                    text: "Myth Center"
                    color: MythColors.textPrimary
                    font.pixelSize: 32
                    font.weight: Font.Bold
                    font.family: MythTypography.baseFontFamily
                }

                // PageSub
                Text {
                    Layout.topMargin: -12
                    text: "The official MythOS system settings application."
                    color: MythColors.textSecondary
                    font.pixelSize: 16
                    font.family: MythTypography.baseFontFamily
                }

                // Glass Container
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: Math.max(520, contentRow.implicitHeight)
                    Layout.topMargin: 8
                    color: Qt.rgba(255, 255, 255, 0.03)
                    border.color: MythColors.borderSubtle
                    border.width: 1
                    radius: 12
                    clip: true

                    RowLayout {
                        id: contentRow
                        anchors.fill: parent
                        spacing: 0

                        // Sidebar
                        Item {
                            Layout.preferredWidth: 200
                            Layout.fillHeight: true

                            Rectangle {
                                anchors.right: parent.right
                                width: 1
                                height: parent.height
                                color: MythColors.borderSubtle
                            }

                            ListView {
                                anchors.fill: parent
                                anchors.margins: 8
                                anchors.topMargin: 16
                                anchors.bottomMargin: 16
                                model: sectionsModel
                                interactive: false
                                delegate: Rectangle {
                                    width: ListView.view.width
                                    height: 32
                                    radius: 8
                                    color: root.currentSection === name ? Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.15) : "transparent"
                                    
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 14
                                        text: name
                                        color: root.currentSection === name ? MythColors.textPrimary : MythColors.textSecondary
                                        font.pixelSize: 13
                                        font.weight: root.currentSection === name ? Font.Medium : Font.Normal
                                        font.family: MythTypography.baseFontFamily
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: root.currentSection = name
                                    }
                                }
                            }
                        }

                        // Content
                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 24
                                anchors.leftMargin: 28
                                anchors.rightMargin: 28
                                anchors.topMargin: 24
                                spacing: 20

                                Text {
                                    text: root.currentSection
                                    font.pixelSize: 20
                                    font.weight: Font.DemiBold
                                    color: MythColors.textPrimary
                                    font.family: MythTypography.baseFontFamily
                                }

                                Loader {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    sourceComponent: {
                                        if (root.currentSection === "Appearance") return appearanceComponent;
                                        if (root.currentSection === "AI") return aiComponent;
                                        return fallbackComponent;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
