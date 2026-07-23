import os

pages = [
    "ProductPrinciplesPage", "BrandPage", "DesignTokensPage", 
    "TypographyPage", "IconographyPage", "CoreComponentsPage", 
    "AdvancedComponentsPage", "BootExperiencePage", "DesktopShellPage", 
    "MythCommandPage", "ControlCenterPage", "NotificationsPage", 
    "SystemDialogsPage", "MythCenterPage", "MythHubPage", 
    "MythTerminalPage", "MythStorePage", "MythAIPage", 
    "DeveloperHandoffPage"
]

template = """import QtQuick 6.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.0

Item {{
    anchors.fill: parent

    ColumnLayout {{
        anchors.centerIn: parent
        spacing: 16

        Text {{
            text: "{name}"
            font.family: "Inter"
            font.pixelSize: 32
            font.weight: Font.Bold
            color: "#F5F7FF"
            Layout.alignment: Qt.AlignHCenter
        }}

        Text {{
            text: "Content for this page is currently under development."
            font.family: "Inter"
            font.pixelSize: 16
            color: "#9CA3AF"
            Layout.alignment: Qt.AlignHCenter
        }}
    }}
}}
"""

for page in pages:
    filepath = f"examples/pages/{page}.qml"
    with open(filepath, "w") as f:
            # Insert spaces before capital letters for the display name
        display_name = "".join([" " + c if c.isupper() else c for c in page]).strip().replace(" Page", "")
        f.write(template.format(name=display_name))

print("Created 19 placeholder pages.")
