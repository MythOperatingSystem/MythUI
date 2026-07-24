import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: rootStore
    anchors.fill: parent

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: availableWidth

        ColumnLayout {
            width: parent.width
            spacing: 28

            Item { Layout.preferredHeight: 16 } // Top margin

            // Page Header Section
            ColumnLayout {
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                spacing: 8

                RowLayout {
                    spacing: 8
                    
                    Rectangle {
                        color: "transparent"
                        border.color: MythColors.mythCyan
                        border.width: 1
                        radius: 4
                        implicitWidth: badgeNum.implicitWidth + 12
                        implicitHeight: badgeNum.implicitHeight + 6
                        Rectangle {
                            anchors.fill: parent
                            color: MythColors.mythCyan
                            opacity: 0.1
                            radius: 4
                        }
                        Text {
                            id: badgeNum
                            anchors.centerIn: parent
                            text: "23"
                            color: MythColors.mythCyan
                            font.family: MythTypography.codeFont
                            font.pixelSize: 10
                        }
                    }
                    
                    Text {
                        text: "MYTH STORE"
                        color: MythColors.textSecondary
                        font.family: MythTypography.codeFont
                        font.pixelSize: 10
                        font.letterSpacing: 1.2
                    }
                }

                Text {
                    text: "Myth Store"
                    font.family: MythTypography.uiFont
                    font.pixelSize: MythTypography.h1Size
                    font.weight: Font.Bold
                    color: MythColors.textPrimary
                }

                Text {
                    text: "Application management — search, install, update, and verify software."
                    font.family: MythTypography.uiFont
                    font.pixelSize: MythTypography.bodySize
                    color: MythColors.textSecondary
                    Layout.fillWidth: true
                    wrapMode: Text.WordWrap
                }
            }

            // Search Bar & Filter Pills
            RowLayout {
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                spacing: 16

                Rectangle {
                    Layout.fillWidth: true
                    implicitHeight: 44
                    radius: 12
                    color: Qt.rgba(1, 1, 1, 0.04)
                    border.color: MythColors.borderSubtle
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        anchors.rightMargin: 16
                        spacing: 12

                        MythIcon {
                            name: "search"
                            iconSize: 18
                            iconColor: MythColors.mythCyan
                        }

                        TextInput {
                            id: searchInput
                            Layout.fillWidth: true
                            font.family: MythTypography.uiFont
                            font.pixelSize: 14
                            color: MythColors.textPrimary
                            selectByMouse: true

                            Text {
                                text: "Search applications, utilities, packages..."
                                font.family: MythTypography.uiFont
                                font.pixelSize: 14
                                color: MythColors.textMuted
                                visible: searchInput.text === ""
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }

                RowLayout {
                    spacing: 8
                    
                    Repeater {
                        model: ["All", "Dev", "Design", "Security", "Tools"]
                        
                        MythButton {
                            text: modelData
                            variant: index === 0 ? "primary" : "secondary"
                            size: "sm"
                        }
                    }
                }
            }

            // Section Label
            Text {
                Layout.leftMargin: 40
                text: "FEATURED APPLICATIONS"
                color: MythColors.textSecondary
                font.family: MythTypography.codeFont
                font.pixelSize: 10
                font.letterSpacing: 1.2
            }

            // Apps Grid — Spacious 2-column layout with no overlaps
            GridLayout {
                columns: 2
                Layout.fillWidth: true
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.bottomMargin: 48
                rowSpacing: 20
                columnSpacing: 20

                Repeater {
                    model: [
                        { name: "Neovim", cat: "Development", desc: "Hyperextensible Vim-based text editor built for high speed terminal workflows.", size: "12.4 MB", source: "Native", verified: true, appColor: MythColors.mythCyan, status: "install" },
                        { name: "Figma Linux", cat: "Design", desc: "Collaborative interface design tool running natively on MythOS with GPU acceleration.", size: "184 MB", source: "Flatpak", verified: true, appColor: MythColors.mythPurple, status: "installed" },
                        { name: "Docker Desktop", cat: "Development", desc: "Container management dashboard, engine runtime, and image inspector.", size: "92 MB", source: "Repository", verified: true, appColor: MythColors.mythCyan, status: "update" },
                        { name: "Obsidian", cat: "Productivity", desc: "Knowledge base and markdown note taking system with local graph visualization.", size: "110 MB", source: "Flatpak", verified: false, appColor: MythColors.warning, status: "install" },
                        { name: "WireGuard", cat: "Security", desc: "Extremely simple yet fast and modern VPN service with state-of-the-art cryptography.", size: "4.2 MB", source: "Native", verified: true, appColor: MythColors.error, status: "install" },
                        { name: "Blender 3D", cat: "Design", desc: "Open-source 3D creation suite supporting modeling, rendering, and animation.", size: "212 MB", source: "Flatpak", verified: true, appColor: MythColors.warning, status: "installing" }
                    ]

                    Glass {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        implicitHeight: cardCol.implicitHeight + 40

                        ColumnLayout {
                            id: cardCol
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 16

                            // Top Row: App Icon + Titles + Source Badges
                            RowLayout {
                                Layout.fillWidth: true
                                spacing: 16
                                Layout.alignment: Qt.AlignTop

                                // App Icon
                                Rectangle {
                                    width: 52
                                    height: 52
                                    radius: 14
                                    color: Qt.rgba(modelData.appColor.r, modelData.appColor.g, modelData.appColor.b, 0.15)
                                    border.color: Qt.rgba(modelData.appColor.r, modelData.appColor.g, modelData.appColor.b, 0.35)
                                    border.width: 1
                                    Layout.alignment: Qt.AlignTop

                                    Text {
                                        anchors.centerIn: parent
                                        text: modelData.name.charAt(0)
                                        font.pixelSize: 22
                                        font.weight: Font.Bold
                                        color: modelData.appColor
                                    }
                                }

                                // Titles & Description
                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 4

                                    RowLayout {
                                        Layout.fillWidth: true
                                        spacing: 8

                                        Text {
                                            text: modelData.name
                                            font.family: MythTypography.uiFont
                                            font.pixelSize: 16
                                            font.weight: Font.Bold
                                            color: MythColors.textPrimary
                                        }

                                        Item { Layout.fillWidth: true }

                                        // Badges
                                        RowLayout {
                                            spacing: 6
                                            MythBadge {
                                                text: modelData.source
                                                color: modelData.verified ? MythColors.mythCyan : MythColors.warning
                                            }
                                            MythBadge {
                                                visible: !modelData.verified
                                                text: "Unverified"
                                                color: MythColors.warning
                                            }
                                        }
                                    }

                                    Text {
                                        text: modelData.cat
                                        font.family: MythTypography.codeFont
                                        font.pixelSize: 11
                                        color: modelData.appColor
                                    }

                                    Text {
                                        Layout.fillWidth: true
                                        text: modelData.desc
                                        font.family: MythTypography.uiFont
                                        font.pixelSize: 12
                                        color: MythColors.textSecondary
                                        wrapMode: Text.WordWrap
                                        maximumLineCount: 2
                                        elide: Text.ElideRight
                                        Layout.topMargin: 2
                                    }
                                }
                            }

                            // Divider
                            Rectangle {
                                Layout.fillWidth: true
                                implicitHeight: 1
                                color: MythColors.borderSubtle
                            }

                            // Bottom Action Bar: Size on Left, Install Button on Right
                            RowLayout {
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignVCenter

                                Text {
                                    text: "SIZE: " + modelData.size
                                    font.family: MythTypography.codeFont
                                    font.pixelSize: 11
                                    color: MythColors.textMuted
                                }

                                Item { Layout.fillWidth: true }

                                // Action Button
                                MythButton {
                                    id: btn
                                    property bool isAppBusy: packageManager && packageManager.isBusy && packageManager.currentApp === modelData.name
                                    variant: isAppBusy ? "ghost" : (modelData.status === "installed" ? "ghost" : modelData.status === "update" ? "secondary" : "primary")
                                    size: "sm"
                                    enabled: !isAppBusy
                                    text: isAppBusy ? (packageManager.progressPercent + "%") : (modelData.status === "install" ? "Install" : modelData.status === "installed" ? "Open" : modelData.status === "update" ? "Update" : "Install")
                                    
                                    onClicked: {
                                        if (modelData.status === "installed") {
                                            if (waylandCompositor) {
                                                waylandCompositor.launchApplication(modelData.name.toLowerCase());
                                            }
                                        } else if (packageManager) {
                                            packageManager.installPackage(modelData.name, modelData.name.toLowerCase(), modelData.source);
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
}
