import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
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
            spacing: 0

            PageBadge { 
                num: "04"
                label: "Typography" 
                Layout.topMargin: 32
                Layout.bottomMargin: 16
            }
            
            PageH1 { 
                text: "Typography System" 
                Layout.bottomMargin: 8
            }
            
            PageSub { 
                text: "Inter for UI. JetBrains Mono for code, data, and technical labels." 
                Layout.bottomMargin: 48
            }

            SectionTag { 
                text: "Display — Inter" 
                Layout.bottomMargin: 16
            }
            
            Glass {
                Layout.fillWidth: true
                Layout.bottomMargin: 48
                padding: 32

                ColumnLayout {
                    width: parent.width
                    spacing: 0
                    
                    Repeater {
                        model: [
                            { name: "Display XL", size: 64, lh: 72, weight: 600 },
                            { name: "Display Large", size: 48, lh: 56, weight: 600 },
                            { name: "Display Medium", size: 40, lh: 48, weight: 600 }
                        ]
                        
                        delegate: ColumnLayout {
                            Layout.fillWidth: true
                            
                            RowLayout {
                                Layout.fillWidth: true
                                spacing: 20
                                
                                ColumnLayout {
                                    Layout.minimumWidth: 140
                                    Layout.preferredWidth: 140
                                    Layout.alignment: Qt.AlignBaseline
                                    spacing: 4
                                    
                                    Text {
                                        text: modelData.name
                                        font.family: MythTypography.mono // Fallback to "JetBrains Mono" in theme
                                        font.pixelSize: 10
                                        color: MythColors.text2
                                    }
                                    Text {
                                        text: modelData.size + "/" + modelData.lh + " · W" + modelData.weight
                                        font.family: MythTypography.mono
                                        font.pixelSize: 9
                                        color: MythColors.textMuted
                                    }
                                }
                                
                                Text {
                                    text: "System Architecture"
                                    font.family: MythTypography.sans
                                    font.pixelSize: modelData.size
                                    font.weight: modelData.weight
                                    lineHeight: modelData.lh / modelData.size
                                    lineHeightMode: Text.ProportionalHeight
                                    font.letterSpacing: -0.03 * modelData.size
                                    color: MythColors.text
                                    Layout.alignment: Qt.AlignBaseline
                                }
                            }
                            
                            Rectangle {
                                Layout.fillWidth: true
                                height: 1
                                color: MythColors.borderSubtle
                                Layout.topMargin: 16
                                Layout.bottomMargin: 16
                            }
                        }
                    }
                }
            }

            SectionTag { 
                text: "Headings — Inter" 
                Layout.bottomMargin: 16
            }
            
            Glass {
                Layout.fillWidth: true
                Layout.bottomMargin: 48
                padding: 32

                ColumnLayout {
                    width: parent.width
                    spacing: 0
                    
                    Repeater {
                        model: [
                            { name: "Heading 1", size: 32, lh: 40, weight: 600 },
                            { name: "Heading 2", size: 24, lh: 32, weight: 600 },
                            { name: "Heading 3", size: 20, lh: 28, weight: 500 },
                            { name: "Heading 4", size: 18, lh: 24, weight: 500 }
                        ]
                        
                        delegate: ColumnLayout {
                            Layout.fillWidth: true
                            
                            RowLayout {
                                Layout.fillWidth: true
                                spacing: 20
                                
                                ColumnLayout {
                                    Layout.minimumWidth: 140
                                    Layout.preferredWidth: 140
                                    Layout.alignment: Qt.AlignBaseline
                                    spacing: 4
                                    
                                    Text {
                                        text: modelData.name
                                        font.family: MythTypography.mono
                                        font.pixelSize: 10
                                        color: MythColors.text2
                                    }
                                    Text {
                                        text: modelData.size + "/" + modelData.lh + " · W" + modelData.weight
                                        font.family: MythTypography.mono
                                        font.pixelSize: 9
                                        color: MythColors.textMuted
                                    }
                                }
                                
                                Text {
                                    text: "System Architecture"
                                    font.family: MythTypography.sans
                                    font.pixelSize: modelData.size
                                    font.weight: modelData.weight
                                    lineHeight: modelData.lh / modelData.size
                                    lineHeightMode: Text.ProportionalHeight
                                    color: MythColors.text
                                    Layout.alignment: Qt.AlignBaseline
                                }
                            }
                            
                            Rectangle {
                                Layout.fillWidth: true
                                height: 1
                                color: MythColors.borderSubtle
                                Layout.topMargin: 12
                                Layout.bottomMargin: 12
                            }
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.bottomMargin: 48
                spacing: 24
                
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop
                    spacing: 0
                    
                    SectionTag { 
                        text: "Body — Inter" 
                        Layout.bottomMargin: 16
                    }
                    
                    Glass {
                        Layout.fillWidth: true
                        padding: 24
                        
                        ColumnLayout {
                            width: parent.width
                            spacing: 0
                            
                            Repeater {
                                model: [
                                    { name: "Body Large", size: 18, lh: 28, weight: 400 },
                                    { name: "Body Medium", size: 16, lh: 24, weight: 400 },
                                    { name: "Body Small", size: 14, lh: 20, weight: 400 }
                                ]
                                
                                delegate: ColumnLayout {
                                    Layout.fillWidth: true
                                    
                                    Text {
                                        text: modelData.name + " · " + modelData.size + "/" + modelData.lh
                                        font.family: MythTypography.mono
                                        font.pixelSize: 10
                                        color: MythColors.text2
                                        Layout.bottomMargin: 6
                                    }
                                    Text {
                                        text: "MythOS is an intelligent, futuristic operating system designed for developers and creators."
                                        font.family: MythTypography.sans
                                        font.pixelSize: modelData.size
                                        font.weight: modelData.weight
                                        lineHeight: modelData.lh / modelData.size
                                        lineHeightMode: Text.ProportionalHeight
                                        color: MythColors.text
                                        wrapMode: Text.WordWrap
                                        Layout.fillWidth: true
                                    }
                                    
                                    Rectangle {
                                        Layout.fillWidth: true
                                        height: 1
                                        color: MythColors.borderSubtle
                                        Layout.topMargin: 16
                                        Layout.bottomMargin: 16
                                    }
                                }
                            }
                        }
                    }
                }
                
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop
                    spacing: 0
                    
                    SectionTag { 
                        text: "Labels & Caption — Inter" 
                        Layout.bottomMargin: 16
                    }
                    
                    Glass {
                        Layout.fillWidth: true
                        padding: 24
                        
                        ColumnLayout {
                            width: parent.width
                            spacing: 0
                            
                            Repeater {
                                model: [
                                    { name: "Label Large", size: 16, lh: 20, weight: 500 },
                                    { name: "Label Medium", size: 14, lh: 18, weight: 500 },
                                    { name: "Label Small", size: 12, lh: 16, weight: 500 },
                                    { name: "Caption", size: 12, lh: 16, weight: 400 }
                                ]
                                
                                delegate: ColumnLayout {
                                    Layout.fillWidth: true
                                    
                                    Text {
                                        text: modelData.name + " · " + modelData.size + "/" + modelData.lh
                                        font.family: MythTypography.mono
                                        font.pixelSize: 10
                                        color: MythColors.text2
                                        Layout.bottomMargin: 4
                                    }
                                    Text {
                                        text: "Network Connection"
                                        font.family: MythTypography.sans
                                        font.pixelSize: modelData.size
                                        font.weight: modelData.weight
                                        lineHeight: modelData.lh / modelData.size
                                        lineHeightMode: Text.ProportionalHeight
                                        color: MythColors.text
                                    }
                                    
                                    Rectangle {
                                        Layout.fillWidth: true
                                        height: 1
                                        color: MythColors.borderSubtle
                                        Layout.topMargin: 14
                                        Layout.bottomMargin: 14
                                    }
                                }
                            }
                        }
                    }
                }
            }

            SectionTag { 
                text: "Code — JetBrains Mono" 
                Layout.bottomMargin: 16
            }
            
            Glass {
                Layout.fillWidth: true
                padding: 32
                Layout.bottomMargin: 48
                
                Rectangle {
                    anchors.fill: parent
                    color: MythColors.cyan
                    opacity: 0.05
                    z: -1
                    radius: parent.radius !== undefined ? parent.radius : 0
                }
                
                ColumnLayout {
                    width: parent.width
                    spacing: 0
                    
                    Repeater {
                        model: [
                            { name: "Code Large", size: 16, lh: 24 },
                            { name: "Code Medium", size: 14, lh: 22 },
                            { name: "Code Small", size: 12, lh: 18 }
                        ]
                        
                        delegate: ColumnLayout {
                            Layout.fillWidth: true
                            
                            RowLayout {
                                Layout.fillWidth: true
                                spacing: 20
                                
                                ColumnLayout {
                                    Layout.minimumWidth: 140
                                    Layout.preferredWidth: 140
                                    Layout.alignment: Qt.AlignBaseline
                                    spacing: 4
                                    
                                    Text {
                                        text: modelData.name
                                        font.family: MythTypography.mono
                                        font.pixelSize: 10
                                        color: MythColors.text2
                                    }
                                    Text {
                                        text: modelData.size + "/" + modelData.lh
                                        font.family: MythTypography.mono
                                        font.pixelSize: 9
                                        color: MythColors.textMuted
                                    }
                                }
                                
                                Text {
                                    text: "const kernel = MythOS.init({ ai: true, dev: true });"
                                    font.family: MythTypography.mono
                                    font.pixelSize: modelData.size
                                    lineHeight: modelData.lh / modelData.size
                                    lineHeightMode: Text.ProportionalHeight
                                    color: MythColors.cyan
                                    Layout.alignment: Qt.AlignBaseline
                                }
                            }
                            
                            Rectangle {
                                Layout.fillWidth: true
                                height: 1
                                color: MythColors.borderSubtle
                                Layout.topMargin: 16
                                Layout.bottomMargin: 16
                            }
                        }
                    }
                }
            }
        }
    }
}
