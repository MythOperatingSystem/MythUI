import os

files_to_fix = [
    '/home/myth/Desktop/MythOS/MythUI/examples/pages/CoverPage.qml',
    '/home/myth/Desktop/MythOS/MythUI/examples/pages/TypographyPage.qml',
    '/home/myth/Desktop/MythOS/MythUI/examples/pages/IconographyPage.qml',
    '/home/myth/Desktop/MythOS/MythUI/examples/pages/DesignTokensPage.qml',
]

for filepath in files_to_fix:
    with open(filepath, 'r') as f:
        content = f.read()
    
    if 'import MythUI' not in content:
        # Insert import MythUI 1.0 after import QtQuick.Controls
        content = content.replace('import QtQuick.Controls 6.0', 'import QtQuick.Controls 6.0\nimport MythUI 1.0')
        with open(filepath, 'w') as f:
            f.write(content)
            print(f"Added import MythUI to {os.path.basename(filepath)}")

print("Done.")
