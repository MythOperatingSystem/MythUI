import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    anchors.fill: parent

    ScrollView {
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 24

            MythPageBadge {
                num: "23"
                label: "Myth Store"
            }

            ColumnLayout {
                spacing: 8

                Label {
                    text: "Myth Store"
                    font: MythTypography.h1
                    color: MythColors.textPrimary
                }

                Label {
                    text: "Application management — search, install, update, and verify software."
                    font: MythTypography.body
                    color: MythColors.textSecondary
                    Layout.fillWidth: true
                    wrapMode: Text.WordWrap
                }
            }

            // Search
            RowLayout {
                Layout.fillWidth: true
                spacing: 12
                Layout.bottomMargin: 8

                Rectangle {
                    Layout.fillWidth: true
                    implicitHeight: 40
                    radius: 12
                    color: "rgba(255,255,255,0.04)"
                    border.color: MythColors.borderSubtle
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        anchors.rightMargin: 16
                        spacing: 10

                        MythIcon {
                            name: "Search"
                            size: 16
                            color: MythColors.textSecondary
                        }

                        Label {
                            text: "Search applications..."
                            font: MythTypography.body
                            color: MythColors.textMuted
                            Layout.fillWidth: true
                        }
                    }
                }

                RowLayout {
                    spacing: 8
                    
                    Repeater {
                        model: ["All", "Dev", "Design", "Security"]
                        
                        MythButton {
                            text: modelData
                            variant: "secondary"
                            size: "sm"
                        }
                    }
                }
            }

            GridLayout {
                columns: 3
                Layout.fillWidth: true
                rowSpacing: 14
                columnSpacing: 14

                Repeater {
                    model: [
                        { name: "Neovim", cat: "Development", size: "12.4 MB", source: "Native", verified: true, appColor: MythColors.success, status: "install" },
                        { name: "Figma Linux", cat: "Design", size: "184 MB", source: "Flatpak", verified: true, appColor: MythColors.purple, status: "installed" },
                        { name: "Docker", cat: "Development", size: "92 MB", source: "Repository", verified: true, appColor: MythColors.mythCyan, status: "update" },
                        { name: "Obsidian", cat: "Productivity", size: "110 MB", source: "Flatpak", verified: false, appColor: MythColors.warning, status: "install" },
                        { name: "WireGuard", cat: "Security", size: "4.2 MB", source: "Native", verified: true, appColor: MythColors.error, status: "install" },
                        { name: "Blender", cat: "Design", size: "212 MB", source: "Flatpak", verified: true, appColor: MythColors.warning, status: "installing" }
                    ]

                    MythGlass {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        implicitHeight: content.implicitHeight + 44

                        ColumnLayout {
                            id: content
                            anchors.fill: parent
                            anchors.margins: 22
                            spacing: 14

                            RowLayout {
                                Layout.fillWidth: true
                                spacing: 14

                                Rectangle {
                                    width: 48
                                    height: 48
                                    radius: 12
                                    color: Qt.alpha(modelData.appColor, 0.12)
                                    border.color: Qt.alpha(modelData.appColor, 0.25)
                                    border.width: 1

                                    Label {
                                        anchors.centerIn: parent
                                        text: modelData.name.charAt(0)
                                        font.pixelSize: 20
                                        font.weight: Font.DemiBold
                                        color: modelData.appColor
                                    }
                                }

                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 2

                                    Label {
                                        text: modelData.name
                                        font: MythTypography.bodyStrong
                                        color: MythColors.textPrimary
                                    }

                                    Label {
                                        text: modelData.cat
                                        font: MythTypography.caption
                                        color: MythColors.textSecondary
                                    }

                                    RowLayout {
                                        spacing: 6
                                        Layout.topMargin: 4

                                        MythBadge {
                                            text: modelData.source
                                            color: modelData.verified ? MythColors.success : MythColors.warning
                                        }

                                        MythBadge {
                                            visible: !modelData.verified
                                            text: "Unverified"
                                            color: MythColors.warning
                                        }
                                    }
                                }
                            }

                            RowLayout {
                                Layout.fillWidth: true
                                
                                Label {
                                    text: modelData.size
                                    font: MythTypography.mono
                                    color: MythColors.textMuted
                                    Layout.fillWidth: true
                                }
                            }
                        }

                        // Install button absolutely positioned in the bottom right with blurry bg
                        Rectangle {
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.margins: 14
                            color: "transparent"
                            radius: 8
                            border.color: Qt.alpha(MythColors.borderSubtle, 0.5)
                            
                            // Fake blur using alpha overlay since MultiEffect might not be imported
                            Rectangle {
                                anchors.fill: parent
                                radius: 8
                                color: Qt.alpha(MythColors.voidBlack, 0.4)
                            }
                            
                            MythButton {
                                variant: modelData.status === "installed" ? "ghost" : modelData.status === "update" ? "secondary" : modelData.status === "installing" ? "ghost" : "primary"
                                size: "sm"
                                enabled: modelData.status !== "installing"
                                text: modelData.status === "install" ? "Install" : modelData.status === "installed" ? "Open" : modelData.status === "update" ? "Update" : "Installing..."
                                anchors.centerIn: parent
                            }
                            
                            width: 80
                            height: 32
                        }
                    }
                }
            }
        }
    }
}
