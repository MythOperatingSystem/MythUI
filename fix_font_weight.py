import os
import glob

qml_files = glob.glob('/home/myth/Desktop/MythOS/MythUI/**/*.qml', recursive=True)

for filepath in qml_files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    modified = content.replace("Font.SemiBold", "Font.DemiBold")
    modified = modified.replace(" letterSpacing:", " font.letterSpacing:")
    modified = modified.replace("\n    letterSpacing:", "\n    font.letterSpacing:")
    
    if modified != content:
        with open(filepath, 'w') as f:
            f.write(modified)
            print(f"Fixed {os.path.basename(filepath)}")

print("Done.")
