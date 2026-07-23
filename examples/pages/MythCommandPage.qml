import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MythUI 1.0

Item {
    id: root
    anchors.fill: parent

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width
            spacing: 24
            
            Item { Layout.preferredHeight: 40 } // Top padding
            
            ColumnLayout {
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.fillWidth: true
                spacing: 8
                
                // PageBadge
                RowLayout {
                    spacing: 8
                    Rectangle {
                        width: 24
                        height: 24
                        radius: 4
                        color: MythColors.mythCyan
                        Text {
                            text: "16"
                            color: MythColors.voidBlack
                            font.pixelSize: 12
                            font.bold: true
                            anchors.centerIn: parent
                        }
                    }
                    Text {
                        text: "Myth Command"
                        color: MythColors.mythCyan
                        font.pixelSize: 12
                        font.bold: true
                    }
                }
                
                // PageH1
                Text {
                    text: "Myth Command"
                    color: MythColors.textPrimary
                    font.pixelSize: 32
                    font.bold: true
                }
                
                // PageSub
                Text {
                    text: "Universal launcher. Super + Space. Applications, files, settings, AI actions."
                    color: MythColors.textSecondary
                    font.pixelSize: 16
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
            }
            
            // Command palette
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: commandPalette.height
                Layout.topMargin: 24
                Layout.bottomMargin: 24
                
                Rectangle {
                    id: commandPalette
                    width: 640
                    height: commandLayout.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Qt.rgba(23/255, 26/255, 36/255, 0.95)
                    border.color: MythColors.borderStrong
                    border.width: 1
                    radius: 20
                    clip: true
                    layer.enabled: true
                    
                    ColumnLayout {
                        id: commandLayout
                        width: parent.width
                        spacing: 0
                        
                        // Search input
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 52
                            
                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 20
                                anchors.rightMargin: 20
                                spacing: 12
                                
                                Text {
                                    text: "🔍"
                                    color: MythColors.textSecondary
                                    font.pixelSize: 18
                                }
                                
                                TextInput {
                                    Layout.fillWidth: true
                                    text: "open terminal"
                                    color: MythColors.textPrimary
                                    font.pixelSize: 16
                                    font.family: "Inter"
                                    selectionColor: MythColors.mythCyan
                                }
                                
                                Rectangle {
                                    color: "transparent"
                                    border.color: MythColors.borderSubtle
                                    border.width: 1
                                    radius: 4
                                    Layout.preferredHeight: 18
                                    Layout.preferredWidth: 30
                                    Text {
                                        anchors.centerIn: parent
                                        text: "ESC"
                                        color: MythColors.textMuted
                                        font.pixelSize: 10
                                        font.family: "JetBrains Mono"
                                    }
                                }
                            }
                            
                            Rectangle {
                                anchors.bottom: parent.bottom
                                width: parent.width
                                height: 1
                                color: MythColors.borderSubtle
                            }
                        }
                        
                        // Results
                        ColumnLayout {
                            Layout.fillWidth: true
                            Layout.topMargin: 8
                            Layout.bottomMargin: 8
                            spacing: 0
                            
                            Text {
                                text: "APPLICATIONS"
                                color: MythColors.textMuted
                                font.pixelSize: 9
                                font.family: "JetBrains Mono"
                                font.letterSpacing: 1.2
                                Layout.leftMargin: 16
                                Layout.rightMargin: 16
                                Layout.topMargin: 4
                                Layout.bottomMargin: 6
                            }
                            
                            // Result 1
                            Rectangle {
                                Layout.fillWidth: true
                                height: 52
                                color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.1)
                                
                                Rectangle {
                                    width: 2; height: parent.height
                                    color: MythColors.mythCyan
                                }
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16
                                    spacing: 12
                                    
                                    Rectangle {
                                        width: 32; height: 32; radius: 8
                                        color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.2)
                                        Text {
                                            text: "T"
                                            color: MythColors.mythCyan
                                            anchors.centerIn: parent
                                        }
                                    }
                                    
                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 2
                                        Text {
                                            text: "Myth Terminal"
                                            color: MythColors.textPrimary
                                            font.pixelSize: 14
                                        }
                                        Text {
                                            text: "Application"
                                            color: MythColors.textMuted
                                            font.pixelSize: 11
                                        }
                                    }
                                    
                                    Rectangle {
                                        color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.2)
                                        radius: 4
                                        Layout.preferredHeight: 20
                                        Layout.preferredWidth: 32
                                        Text {
                                            text: "App"
                                            color: MythColors.mythCyan
                                            anchors.centerIn: parent
                                            font.pixelSize: 10
                                        }
                                    }
                                }
                            }
                            
                            // Result 2
                            Rectangle {
                                Layout.fillWidth: true
                                height: 52
                                color: "transparent"
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16
                                    spacing: 12
                                    
                                    Rectangle {
                                        width: 32; height: 32; radius: 8
                                        color: Qt.rgba(255/255, 255/255, 255/255, 0.05)
                                        Text {
                                            text: "T"
                                            color: MythColors.textSecondary
                                            anchors.centerIn: parent
                                        }
                                    }
                                    
                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 2
                                        Text {
                                            text: "Open Terminal Here"
                                            color: MythColors.textSecondary
                                            font.pixelSize: 14
                                        }
                                        Text {
                                            text: "File Manager action"
                                            color: MythColors.textMuted
                                            font.pixelSize: 11
                                        }
                                    }
                                    
                                    Rectangle {
                                        color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.2)
                                        radius: 4
                                        Layout.preferredHeight: 20
                                        Layout.preferredWidth: 48
                                        Text {
                                            text: "Action"
                                            color: MythColors.mythCyan
                                            anchors.centerIn: parent
                                            font.pixelSize: 10
                                        }
                                    }
                                }
                            }
                            
                            // Result 3
                            Rectangle {
                                Layout.fillWidth: true
                                height: 52
                                color: "transparent"
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16
                                    spacing: 12
                                    
                                    Rectangle {
                                        width: 32; height: 32; radius: 8
                                        color: Qt.rgba(255/255, 255/255, 255/255, 0.05)
                                        Text {
                                            text: "A"
                                            color: MythColors.textSecondary
                                            anchors.centerIn: parent
                                        }
                                    }
                                    
                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 2
                                        Text {
                                            text: "Install a Terminal Emulator"
                                            color: MythColors.textSecondary
                                            font.pixelSize: 14
                                        }
                                        Text {
                                            text: "Myth Store — Development"
                                            color: MythColors.textMuted
                                            font.pixelSize: 11
                                        }
                                    }
                                    
                                    Rectangle {
                                        color: Qt.rgba(MythColors.textSecondary.r, MythColors.textSecondary.g, MythColors.textSecondary.b, 0.2)
                                        radius: 4
                                        Layout.preferredHeight: 20
                                        Layout.preferredWidth: 40
                                        Text {
                                            text: "Store"
                                            color: MythColors.textSecondary
                                            anchors.centerIn: parent
                                            font.pixelSize: 10
                                        }
                                    }
                                }
                            }
                            
                            Text {
                                text: "AI SUGGESTIONS"
                                color: MythColors.mythPurple
                                font.pixelSize: 9
                                font.family: "JetBrains Mono"
                                font.letterSpacing: 1.2
                                Layout.leftMargin: 16
                                Layout.rightMargin: 16
                                Layout.topMargin: 10
                                Layout.bottomMargin: 4
                            }
                            
                            // AI Result 1
                            Rectangle {
                                Layout.fillWidth: true
                                height: 48
                                color: "transparent"
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16
                                    spacing: 12
                                    
                                    Rectangle {
                                        width: 32; height: 32; radius: 8
                                        color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.18)
                                        Text {
                                            text: "◈"
                                            color: MythColors.mythPurple
                                            anchors.centerIn: parent
                                            font.pixelSize: 14
                                        }
                                    }
                                    
                                    Text {
                                        Layout.fillWidth: true
                                        text: "AI: Open terminal in current workspace"
                                        color: MythColors.textSecondary
                                        font.pixelSize: 13
                                    }
                                    
                                    Rectangle {
                                        color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.2)
                                        radius: 4
                                        Layout.preferredHeight: 20
                                        Layout.preferredWidth: 24
                                        Text {
                                            text: "AI"
                                            color: MythColors.mythPurple
                                            anchors.centerIn: parent
                                            font.pixelSize: 10
                                        }
                                    }
                                }
                            }
                            
                            // AI Result 2
                            Rectangle {
                                Layout.fillWidth: true
                                height: 48
                                color: "transparent"
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16
                                    spacing: 12
                                    
                                    Rectangle {
                                        width: 32; height: 32; radius: 8
                                        color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.18)
                                        Text {
                                            text: "◈"
                                            color: MythColors.mythPurple
                                            anchors.centerIn: parent
                                            font.pixelSize: 14
                                        }
                                    }
                                    
                                    Text {
                                        Layout.fillWidth: true
                                        text: "AI: Create a new terminal session with SSH profile"
                                        color: MythColors.textSecondary
                                        font.pixelSize: 13
                                    }
                                    
                                    Rectangle {
                                        color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.2)
                                        radius: 4
                                        Layout.preferredHeight: 20
                                        Layout.preferredWidth: 24
                                        Text {
                                            text: "AI"
                                            color: MythColors.mythPurple
                                            anchors.centerIn: parent
                                            font.pixelSize: 10
                                        }
                                    }
                                }
                            }
                        }
                        
                        // Footer
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 32
                            color: Qt.rgba(255/255, 255/255, 255/255, 0.01)
                            
                            Rectangle {
                                width: parent.width
                                height: 1
                                color: MythColors.borderSubtle
                                anchors.top: parent.top
                            }
                            
                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                spacing: 16
                                
                                // Navigate
                                RowLayout {
                                    spacing: 5
                                    Rectangle {
                                        color: "transparent"
                                        border.color: MythColors.borderSubtle
                                        border.width: 1
                                        radius: 3
                                        Layout.preferredHeight: 14
                                        Layout.preferredWidth: 20
                                        Text {
                                            text: "↑↓"
                                            color: MythColors.textMuted
                                            font.pixelSize: 10
                                            font.family: "JetBrains Mono"
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Text {
                                        text: "Navigate"
                                        color: MythColors.textDisabled
                                        font.pixelSize: 10
                                    }
                                }
                                
                                // Open
                                RowLayout {
                                    spacing: 5
                                    Rectangle {
                                        color: "transparent"
                                        border.color: MythColors.borderSubtle
                                        border.width: 1
                                        radius: 3
                                        Layout.preferredHeight: 14
                                        Layout.preferredWidth: 14
                                        Text {
                                            text: "↵"
                                            color: MythColors.textMuted
                                            font.pixelSize: 10
                                            font.family: "JetBrains Mono"
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Text {
                                        text: "Open"
                                        color: MythColors.textDisabled
                                        font.pixelSize: 10
                                    }
                                }
                                
                                // AI Mode
                                RowLayout {
                                    spacing: 5
                                    Rectangle {
                                        color: "transparent"
                                        border.color: MythColors.borderSubtle
                                        border.width: 1
                                        radius: 3
                                        Layout.preferredHeight: 14
                                        Layout.preferredWidth: 20
                                        Text {
                                            text: "⌘K"
                                            color: MythColors.textMuted
                                            font.pixelSize: 10
                                            font.family: "JetBrains Mono"
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Text {
                                        text: "AI Mode"
                                        color: MythColors.textDisabled
                                        font.pixelSize: 10
                                    }
                                }
                                
                                // Close
                                RowLayout {
                                    spacing: 5
                                    Rectangle {
                                        color: "transparent"
                                        border.color: MythColors.borderSubtle
                                        border.width: 1
                                        radius: 3
                                        Layout.preferredHeight: 14
                                        Layout.preferredWidth: 24
                                        Text {
                                            text: "ESC"
                                            color: MythColors.textMuted
                                            font.pixelSize: 10
                                            font.family: "JetBrains Mono"
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Text {
                                        text: "Close"
                                        color: MythColors.textDisabled
                                        font.pixelSize: 10
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            ColumnLayout {
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.fillWidth: true
                spacing: 16
                
                // SectionTag
                Text {
                    text: "Example Queries"
                    color: MythColors.textPrimary
                    font.pixelSize: 16
                    font.bold: true
                }
                
                GridLayout {
                    columns: 3
                    columnSpacing: 10
                    rowSpacing: 10
                    Layout.fillWidth: true
                    
                    // Item 1
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 44
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.05)
                        border.color: Qt.rgba(255/255, 255/255, 255/255, 0.1)
                        radius: 8
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            
                            Text {
                                text: "open terminal"
                                color: MythColors.textPrimary
                                font.family: "JetBrains Mono"
                                font.pixelSize: 12
                                Layout.fillWidth: true
                            }
                            
                            Rectangle {
                                color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.2)
                                radius: 4
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: t1.width + 8
                                Text {
                                    id: t1
                                    text: "Application"
                                    color: MythColors.mythCyan
                                    anchors.centerIn: parent
                                    font.pixelSize: 10
                                }
                            }
                        }
                    }
                    
                    // Item 2
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 44
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.05)
                        border.color: Qt.rgba(255/255, 255/255, 255/255, 0.1)
                        radius: 8
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            
                            Text {
                                text: "network settings"
                                color: MythColors.textPrimary
                                font.family: "JetBrains Mono"
                                font.pixelSize: 12
                                Layout.fillWidth: true
                            }
                            
                            Rectangle {
                                color: Qt.rgba(MythColors.mythCyan.r, MythColors.mythCyan.g, MythColors.mythCyan.b, 0.2)
                                radius: 4
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: t2.width + 8
                                Text {
                                    id: t2
                                    text: "Setting"
                                    color: MythColors.mythCyan
                                    anchors.centerIn: parent
                                    font.pixelSize: 10
                                }
                            }
                        }
                    }
                    
                    // Item 3
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 44
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.05)
                        border.color: Qt.rgba(255/255, 255/255, 255/255, 0.1)
                        radius: 8
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            
                            Text {
                                text: "install docker"
                                color: MythColors.textPrimary
                                font.family: "JetBrains Mono"
                                font.pixelSize: 12
                                Layout.fillWidth: true
                            }
                            
                            Rectangle {
                                color: Qt.rgba(MythColors.textSecondary.r, MythColors.textSecondary.g, MythColors.textSecondary.b, 0.2)
                                radius: 4
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: t3.width + 8
                                Text {
                                    id: t3
                                    text: "Store action"
                                    color: MythColors.textSecondary
                                    anchors.centerIn: parent
                                    font.pixelSize: 10
                                }
                            }
                        }
                    }
                    
                    // Item 4
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 44
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.05)
                        border.color: Qt.rgba(255/255, 255/255, 255/255, 0.1)
                        radius: 8
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            
                            Text {
                                text: "shutdown"
                                color: MythColors.textPrimary
                                font.family: "JetBrains Mono"
                                font.pixelSize: 12
                                Layout.fillWidth: true
                            }
                            
                            Rectangle {
                                color: Qt.rgba(MythColors.warning.r, MythColors.warning.g, MythColors.warning.b, 0.2)
                                radius: 4
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: t4.width + 8
                                Text {
                                    id: t4
                                    text: "System action"
                                    color: MythColors.warning
                                    anchors.centerIn: parent
                                    font.pixelSize: 10
                                }
                            }
                        }
                    }
                    
                    // Item 5
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 44
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.05)
                        border.color: Qt.rgba(255/255, 255/255, 255/255, 0.1)
                        radius: 8
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            
                            Text {
                                text: "explain error"
                                color: MythColors.textPrimary
                                font.family: "JetBrains Mono"
                                font.pixelSize: 12
                                Layout.fillWidth: true
                            }
                            
                            Rectangle {
                                color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.2)
                                radius: 4
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: t5.width + 8
                                Text {
                                    id: t5
                                    text: "AI action"
                                    color: MythColors.mythPurple
                                    anchors.centerIn: parent
                                    font.pixelSize: 10
                                }
                            }
                        }
                    }
                    
                    // Item 6
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 44
                        color: Qt.rgba(255/255, 255/255, 255/255, 0.05)
                        border.color: Qt.rgba(255/255, 255/255, 255/255, 0.1)
                        radius: 8
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            
                            Text {
                                text: "summarize clipboard"
                                color: MythColors.textPrimary
                                font.family: "JetBrains Mono"
                                font.pixelSize: 12
                                Layout.fillWidth: true
                            }
                            
                            Rectangle {
                                color: Qt.rgba(MythColors.mythPurple.r, MythColors.mythPurple.g, MythColors.mythPurple.b, 0.2)
                                radius: 4
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: t6.width + 8
                                Text {
                                    id: t6
                                    text: "AI action"
                                    color: MythColors.mythPurple
                                    anchors.centerIn: parent
                                    font.pixelSize: 10
                                }
                            }
                        }
                    }
                }
            }
            
            Item { Layout.preferredHeight: 40 } // Bottom padding
        }
    }
}
