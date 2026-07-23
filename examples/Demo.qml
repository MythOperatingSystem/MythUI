import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import MythUI 1.0

Item {
    id: root
    
    // Background Grid & Glow
    Rectangle {
        anchors.fill: parent
        color: MythColors.voidBlack
        
        // Faint radial glow in the center
        Rectangle {
            width: Math.max(parent.width, parent.height) * 1.5
            height: width
            anchors.centerIn: parent
            radius: width / 2
            color: "transparent"
            
            // Simulating a very subtle gradient glow for the background
            Repeater {
                model: 5
                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width * (1.0 - index * 0.15)
                    height: width
                    radius: width / 2
                    color: Qt.rgba(0.00, 0.90, 1.00, 0.005)
                }
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // --- LEFT SIDEBAR ---
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: 260
            color: MythColors.voidBlack
            
            // Right border
            Rectangle {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 1
                color: MythColors.borderSubtle
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 32
                spacing: 0

                // Logo Area
                RowLayout {
                    spacing: 12
                    
                    // Geometric Logo (Canvas)
                    Canvas {
                        width: 24
                        height: 24
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.reset();
                            ctx.lineWidth = 1.5;
                            ctx.strokeStyle = MythColors.mythCyan;
                            ctx.lineJoin = "round";
                            
                            // Draw Hexagon
                            ctx.beginPath();
                            for (var i = 0; i < 6; i++) {
                                var angle = 2 * Math.PI / 6 * i - Math.PI / 2;
                                var x = 12 + 10 * Math.cos(angle);
                                var y = 12 + 10 * Math.sin(angle);
                                if (i === 0) ctx.moveTo(x, y);
                                else ctx.lineTo(x, y);
                            }
                            ctx.closePath();
                            ctx.stroke();

                            // Draw inner triangle
                            ctx.beginPath();
                            ctx.moveTo(12, 6);
                            ctx.lineTo(18, 16);
                            ctx.lineTo(6, 16);
                            ctx.closePath();
                            ctx.stroke();
                        }
                    }

                    ColumnLayout {
                        spacing: 2
                        Text {
                            text: "MythOS"
                            font.family: MythTypography.uiFont
                            font.weight: Font.Bold
                            font.pixelSize: 14
                            color: MythColors.textPrimary
                        }
                        Text {
                            text: "DESIGN SYSTEM v0.0.1"
                            font.family: MythTypography.codeFont
                            font.pixelSize: 8
                            color: MythColors.textMuted
                            font.letterSpacing: 0.5
                        }
                    }
                }

                Item { Layout.preferredHeight: 48 } // Spacer

                // Pages header
                Text {
                    text: "PAGES"
                    font.family: MythTypography.codeFont
                    font.pixelSize: 10
                    color: MythColors.textMuted
                    font.letterSpacing: 1
                    Layout.bottomMargin: 16
                }

                // Page Links (Dynamic ListView)
                ListView {
                    id: sidebarList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 4
                    model: ListModel {
                        id: pagesModel
                        ListElement { pageId: "00"; name: "Cover"; source: "pages/CoverPage.qml" }
                        ListElement { pageId: "01"; name: "Product Principles"; source: "pages/ProductPrinciplesPage.qml" }
                        ListElement { pageId: "02"; name: "Brand"; source: "pages/BrandPage.qml" }
                        ListElement { pageId: "03"; name: "Design Tokens"; source: "pages/DesignTokensPage.qml" }
                        ListElement { pageId: "04"; name: "Typography"; source: "pages/TypographyPage.qml" }
                        ListElement { pageId: "05"; name: "Iconography"; source: "pages/IconographyPage.qml" }
                        ListElement { pageId: "06"; name: "Core Components"; source: "pages/CoreComponentsPage.qml" }
                        ListElement { pageId: "07"; name: "Advanced Components"; source: "pages/AdvancedComponentsPage.qml" }
                        ListElement { pageId: "08"; name: "Boot Experience"; source: "pages/BootExperiencePage.qml" }
                        ListElement { pageId: "09"; name: "Desktop Shell"; source: "pages/DesktopShellPage.qml" }
                        ListElement { pageId: "10"; name: "Myth Command"; source: "pages/MythCommandPage.qml" }
                        ListElement { pageId: "11"; name: "Control Center"; source: "pages/ControlCenterPage.qml" }
                        ListElement { pageId: "12"; name: "Notifications"; source: "pages/NotificationsPage.qml" }
                        ListElement { pageId: "13"; name: "System Dialogs"; source: "pages/SystemDialogsPage.qml" }
                        ListElement { pageId: "14"; name: "Myth Center"; source: "pages/MythCenterPage.qml" }
                        ListElement { pageId: "15"; name: "Myth Hub"; source: "pages/MythHubPage.qml" }
                        ListElement { pageId: "16"; name: "Myth Terminal"; source: "pages/MythTerminalPage.qml" }
                        ListElement { pageId: "17"; name: "Myth Store"; source: "pages/MythStorePage.qml" }
                        ListElement { pageId: "18"; name: "Myth AI"; source: "pages/MythAIPage.qml" }
                        ListElement { pageId: "19"; name: "Developer Handoff"; source: "pages/DeveloperHandoffPage.qml" }
                    }

                    delegate: Rectangle {
                        width: ListView.view.width
                        height: 32
                        color: ListView.isCurrentItem ? Qt.rgba(0, 229, 255, 0.05) : "transparent"
                        radius: 4
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 12
                            spacing: 12
                            
                            Text {
                                text: model.pageId
                                font.family: MythTypography.codeFont
                                font.pixelSize: 11
                                color: parent.parent.ListView.isCurrentItem ? MythColors.mythCyan : MythColors.textMuted
                            }
                            Text {
                                text: model.name
                                font.family: MythTypography.uiFont
                                font.pixelSize: 13
                                font.weight: parent.parent.ListView.isCurrentItem ? Font.DemiBold : Font.Normal
                                color: parent.parent.ListView.isCurrentItem ? MythColors.textPrimary : MythColors.textSecondary
                                Layout.fillWidth: true
                            }
                        }

                        Rectangle {
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            width: 2
                            color: MythColors.mythCyan
                            visible: parent.ListView.isCurrentItem
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: sidebarList.currentIndex = index
                        }
                    }
                }

                // Bottom Sidebar Info
                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    color: MythColors.borderSubtle
                    Layout.bottomMargin: 16
                    Layout.topMargin: 16
                }

                Text {
                    text: "Genesis 1.0\nQt 6 / QML Target\nInter + JetBrains Mono"
                    font.family: MythTypography.codeFont
                    font.pixelSize: 10
                    color: MythColors.textMuted
                    lineHeight: 1.5
                }
            }
        }

        // --- MAIN CONTENT ---
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Loader {
                id: pageLoader
                anchors.fill: parent
                source: sidebarList.model.get(sidebarList.currentIndex).source
            }
        }
    }
}
