import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import MythUI 1.0

Item {
    anchors.fill: parent

    ScrollView {
        anchors.fill: parent
        anchors.margins: 32
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 32

            Text {
                text: "Iconography"
                font.family: MythTypography.uiFont
                font.pixelSize: 32
                font.weight: Font.Bold
                color: MythColors.textPrimary
            }
            
            Text {
                text: "MythOS uses a sharp, line-based icon set representing futuristic, cybernetic elements."
                font.family: MythTypography.codeFont
                font.pixelSize: 14
                color: MythColors.textSecondary
            }

            Rectangle { Layout.fillWidth: true; height: 1; color: MythColors.borderSubtle }

            Flow {
                Layout.fillWidth: true
                spacing: 24

                Repeater {
                    model: ["Home", "Settings", "Search", "Network", "Security", "AI", "Storage", "Power", "Packages", "Terminal", "Tools", "Lock"]
                    
                    Rectangle {
                        width: 80
                        height: 80
                        color: MythColors.borderSubtle
                        radius: 12
                        border.color: MythColors.borderSubtle
                        
                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 8
                            
                            Canvas {
                                Layout.alignment: Qt.AlignHCenter
                                width: 24
                                height: 24
                                
                                property string iconName: modelData
                                property color iconColor: MythColors.mythCyan
                                
                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.reset();
                                    ctx.lineWidth = 1.5;
                                    ctx.strokeStyle = iconColor;
                                    ctx.lineJoin = "miter";
                                    ctx.lineCap = "square";
                                    
                                    ctx.beginPath();
                                    
                                    if (iconName === "Home") {
                                        ctx.moveTo(12, 2); ctx.lineTo(22, 10); ctx.lineTo(22, 22);
                                        ctx.lineTo(2, 22); ctx.lineTo(2, 10); ctx.closePath();
                                        ctx.moveTo(9, 22); ctx.lineTo(9, 14); ctx.lineTo(15, 14); ctx.lineTo(15, 22);
                                    } else if (iconName === "Settings") {
                                        ctx.arc(12, 12, 4, 0, Math.PI * 2);
                                        ctx.moveTo(12, 2); ctx.lineTo(12, 5); ctx.moveTo(12, 19); ctx.lineTo(12, 22);
                                        ctx.moveTo(2, 12); ctx.lineTo(5, 12); ctx.moveTo(19, 12); ctx.lineTo(22, 12);
                                        ctx.moveTo(5, 5); ctx.lineTo(7, 7); ctx.moveTo(17, 17); ctx.lineTo(19, 19);
                                        ctx.moveTo(19, 5); ctx.lineTo(17, 7); ctx.moveTo(5, 19); ctx.lineTo(7, 17);
                                    } else if (iconName === "Search") {
                                        ctx.arc(10, 10, 6, 0, Math.PI * 2);
                                        ctx.moveTo(14.5, 14.5); ctx.lineTo(22, 22);
                                    } else if (iconName === "Network") {
                                        ctx.arc(12, 12, 10, 0, Math.PI * 2);
                                        ctx.moveTo(2, 12); ctx.lineTo(22, 12);
                                        ctx.moveTo(12, 2); ctx.bezierCurveTo(18, 2, 18, 22, 12, 22);
                                        ctx.moveTo(12, 2); ctx.bezierCurveTo(6, 2, 6, 22, 12, 22);
                                    } else if (iconName === "Security") {
                                        ctx.moveTo(12, 2); ctx.lineTo(22, 6); ctx.lineTo(22, 14);
                                        ctx.lineTo(12, 22); ctx.lineTo(2, 14); ctx.lineTo(2, 6); ctx.closePath();
                                        ctx.moveTo(12, 2); ctx.lineTo(12, 22);
                                    } else if (iconName === "AI") {
                                        ctx.moveTo(6, 8); ctx.lineTo(18, 8); ctx.lineTo(18, 18); ctx.lineTo(6, 18); ctx.closePath();
                                        ctx.moveTo(9, 12); ctx.lineTo(9, 14); ctx.moveTo(15, 12); ctx.lineTo(15, 14);
                                        ctx.moveTo(12, 2); ctx.lineTo(12, 8);
                                    } else if (iconName === "Storage") {
                                        ctx.moveTo(4, 4); ctx.lineTo(20, 4); ctx.lineTo(20, 20); ctx.lineTo(4, 20); ctx.closePath();
                                        ctx.moveTo(4, 10); ctx.lineTo(20, 10); ctx.moveTo(4, 16); ctx.lineTo(20, 16);
                                    } else if (iconName === "Power") {
                                        ctx.moveTo(14, 2); ctx.lineTo(8, 12); ctx.lineTo(14, 12); ctx.lineTo(10, 22); ctx.lineTo(16, 10); ctx.lineTo(10, 10); ctx.closePath();
                                    } else if (iconName === "Packages") {
                                        ctx.moveTo(12, 2); ctx.lineTo(22, 7); ctx.lineTo(12, 12); ctx.lineTo(2, 7); ctx.closePath();
                                        ctx.moveTo(2, 7); ctx.lineTo(2, 17); ctx.lineTo(12, 22); ctx.lineTo(12, 12);
                                        ctx.moveTo(22, 7); ctx.lineTo(22, 17); ctx.lineTo(12, 22);
                                    } else if (iconName === "Terminal") {
                                        ctx.moveTo(2, 18); ctx.lineTo(22, 18);
                                        ctx.moveTo(4, 6); ctx.lineTo(10, 10); ctx.lineTo(4, 14);
                                    } else if (iconName === "Tools") {
                                        ctx.moveTo(16, 4); ctx.lineTo(20, 8); ctx.lineTo(8, 20); ctx.lineTo(4, 16); ctx.closePath();
                                        ctx.moveTo(18, 6); ctx.lineTo(22, 2);
                                        ctx.moveTo(6, 18); ctx.lineTo(2, 22);
                                    } else if (iconName === "Lock") {
                                        ctx.moveTo(6, 10); ctx.lineTo(18, 10); ctx.lineTo(18, 20); ctx.lineTo(6, 20); ctx.closePath();
                                        ctx.moveTo(8, 10); ctx.lineTo(8, 6); ctx.arc(12, 6, 4, Math.PI, 0); ctx.lineTo(16, 10);
                                    }
                                    
                                    ctx.stroke();
                                }
                            }
                            
                            Text { text: modelData; font.family: MythTypography.codeFont; font.pixelSize: 10; color: MythColors.textSecondary; Layout.alignment: Qt.AlignHCenter }
                        }
                    }
                }
            }
        }
    }
}
