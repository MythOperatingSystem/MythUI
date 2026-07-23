import os
import glob

qml_dir = "/home/myth/Desktop/MythOS/MythUI/qml"
files = glob.glob(os.path.join(qml_dir, "*.qml"))

for filepath in files:
    with open(filepath, "r") as f:
        content = f.read()
    
    if "import MythUI" not in content:
        content = "import MythUI\n" + content
        with open(filepath, "w") as f:
            f.write(content)

print(f"Updated {len(files)} files.")
