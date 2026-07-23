import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0
import MythUI 1.0

Item {
    anchors.fill: parent

    // Background Grid
    MythGridBackground {
        anchors.fill: parent
    }

    // Cyan Glow Top-Center
    Rectangle {
        width: 700
        height: 700
        x: (parent.width - width) / 2
        y: parent.height * 0.3 - height / 2
        radius: width / 2
        color: MythColors.mythCyan
        opacity: 0.05
        filter: blurFilter
        // In Qt6 QML we can just use a transparent radial gradient, but an opacity circle with blur is standard unless we define a ShaderEffect.
        // Let's use a simpler approach: 
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0, 0.898, 1, 0.10) }
            GradientStop { position: 0.65; color: "transparent" }
        }
    }

    // Purple Glow Bottom-Right
    Rectangle {
        width: 400
        height: 400
        x: parent.width * 0.9 - width / 2
        y: parent.height * 0.9 - height / 2
        radius: width / 2
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.545, 0.361, 1, 0.10) }
            GradientStop { position: 0.70; color: "transparent" }
        }
    }

    // Corner Brackets
    Item {
        anchors.fill: parent
        anchors.margins: 40
        
        // Top Left
        Rectangle { width: 32; height: 1; color: Qt.rgba(0, 0.898, 1, 0.5); anchors.top: parent.top; anchors.left: parent.left }
        Rectangle { width: 1; height: 32; color: Qt.rgba(0, 0.898, 1, 0.5); anchors.top: parent.top; anchors.left: parent.left }
        
        // Top Right
        Rectangle { width: 32; height: 1; color: Qt.rgba(0, 0.898, 1, 0.5); anchors.top: parent.top; anchors.right: parent.right }
        Rectangle { width: 1; height: 32; color: Qt.rgba(0, 0.898, 1, 0.5); anchors.top: parent.top; anchors.right: parent.right }
        
        // Bottom Left
        Rectangle { width: 32; height: 1; color: Qt.rgba(0, 0.898, 1, 0.5); anchors.bottom: parent.bottom; anchors.left: parent.left }
        Rectangle { width: 1; height: 32; color: Qt.rgba(0, 0.898, 1, 0.5); anchors.bottom: parent.bottom; anchors.left: parent.left }
        
        // Bottom Right
        Rectangle { width: 32; height: 1; color: Qt.rgba(0, 0.898, 1, 0.5); anchors.bottom: parent.bottom; anchors.right: parent.right }
        Rectangle { width: 1; height: 32; color: Qt.rgba(0, 0.898, 1, 0.5); anchors.bottom: parent.bottom; anchors.right: parent.right }
    }

    // Main Content
    ColumnLayout {
        anchors.centerIn: parent
        spacing: 0

        Item { Layout.fillWidth: true; Layout.preferredHeight: 80; /* Placeholder for MythLogo */ }

        Item {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 40
            MythBadge { text: "Genesis 1.0 — 0.0.1-pre-alpha"; variant: "ai"; anchors.centerIn: parent }
        }
        
        Text {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 40
            text: "MYTHOS"
            font.family: MythTypography.uiFont
            font.pixelSize: 100
            font.weight: Font.Bold
            font.letterSpacing: -4.5
            color: MythColors.textPrimary
            // In a real app we might use a LinearGradient to fill the text, but color is close enough for QML Text without extra QtGraphicalEffects.
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 12
            text: "FUTURISTIC OPERATING SYSTEM PLATFORM"
            font.family: MythTypography.codeFont
            font.pixelSize: 12
            font.letterSpacing: 3.6
            color: MythColors.textSecondary
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 40
            Layout.maximumWidth: 480
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: "An intelligent operating system for developers, creators, security researchers, and advanced users."
            font.family: MythTypography.uiFont
            font.pixelSize: 14
            color: MythColors.textMuted
            lineHeight: 1.7
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 56
            spacing: 16
            
            Rectangle {
                width: 80; height: 1
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: "transparent" }
                    GradientStop { position: 1.0; color: Qt.rgba(0, 0.898, 1, 0.5) }
                }
            }
            Rectangle { width: 6; height: 6; radius: 3; color: MythColors.mythCyan }
            Rectangle {
                width: 80; height: 1
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: Qt.rgba(0, 0.898, 1, 0.5) }
                    GradientStop { position: 1.0; color: "transparent" }
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 32
            spacing: 32
            Repeater {
                model: ["Design System", "Component Library", "OS Shell Design", "Developer Handoff"]
                Text {
                    text: modelData
                    font.family: MythTypography.codeFont
                    font.pixelSize: 10
                    font.letterSpacing: 0.8
                    color: MythColors.textMuted
                }
            }
        }
    }

    // Bottom Footer
    Item {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 32
        anchors.bottomMargin: 32
        anchors.leftMargin: 64
        anchors.rightMargin: 64
        height: 20
        
        Text {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: "MythOS Design System — Confidential"
            font.family: MythTypography.codeFont
            font.pixelSize: 10
            color: MythColors.textDisabled
        }
        
        Text {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            text: "2026 — All rights reserved"
            font.family: MythTypography.codeFont
            font.pixelSize: 10
            color: MythColors.textDisabled
        }
    }
}
