import os
import glob
import re

qml_files = glob.glob('/home/myth/Desktop/MythOS/MythUI/**/*.qml', recursive=True)

color_map = {
    '"#0D0E15"': 'MythColors.voidBlack',
    '"#090A0F"': 'MythColors.voidBlack',
    '"#12141D"': 'MythColors.surface',
    '"#171A24"': 'MythColors.elevated',
    '"#14151F"': 'MythColors.elevated',
    '"#05050A"': 'MythColors.voidBlack',
    '"#F5F7FF"': 'MythColors.textPrimary',
    '"#9CA3AF"': 'MythColors.textSecondary',
    '"#697181"': 'MythColors.textMuted',
    '"#00E5FF"': 'MythColors.mythCyan',
    '"#8B5CFF"': 'MythColors.mythPurple',
    '"#28C76F"': 'MythColors.success',
    '"#FF5E5E"': 'MythColors.error',
    '"#EF4444"': 'MythColors.error',
    '"#FFC75E"': 'MythColors.warning',
    '"#F59E0B"': 'MythColors.warning',
    'Qt.rgba(1, 1, 1, 0.08)': 'MythColors.borderSubtle',
    'Qt.rgba(1, 1, 1, 0.1)': 'MythColors.borderSubtle',
    'Qt.rgba(1, 1, 1, 0.05)': 'MythColors.borderSubtle',
    'Qt.rgba(1, 1, 1, 0.2)': 'MythColors.borderSubtle',
}

def replace_tokens(content):
    modified = content
    for hex_color, token in color_map.items():
        modified = modified.replace(hex_color, token)
        # Also handle lowercase or single quotes if present
        modified = modified.replace(hex_color.replace('"', "'"), token)
    
    # Typography
    modified = modified.replace('"Inter"', 'MythTypography.uiFont')
    modified = modified.replace('"JetBrains Mono"', 'MythTypography.codeFont')
    modified = modified.replace("'Inter'", 'MythTypography.uiFont')
    modified = modified.replace("'JetBrains Mono'", 'MythTypography.codeFont')

    return modified

for filepath in qml_files:
    # Skip the theme definition files to avoid cyclical references!
    if "MythColors.qml" in filepath or "MythTypography.qml" in filepath or "MythSpacing.qml" in filepath or "MythMotion.qml" in filepath:
        continue

    with open(filepath, 'r') as f:
        content = f.read()
    
    modified = replace_tokens(content)
    
    if modified != content:
        with open(filepath, 'w') as f:
            f.write(modified)
            print(f"Refactored tokens in {os.path.basename(filepath)}")

print("Done.")
