import os
import re

lib_dir = '/home/cirillio/web/csharp/IIoT/iiot_monitoring/lib'

replacements = [
    (re.compile(r'sensorDataType'), 'dataType'),
    (re.compile(r'SensorDataType'), 'TagDataType'),
    (re.compile(r'sensor_data_type'), 'tag_data_type'),
    (re.compile(r'Sensor'), 'Tag'),
    (re.compile(r'sensor'), 'tag'),
    (re.compile(r'Sensors'), 'Tags'),
    (re.compile(r'sensors'), 'tags'),
]

# 1. Content Replacement
for root, dirs, files in os.walk(lib_dir):
    for file in files:
        if not file.endswith('.dart'): continue
        filepath = os.path.join(root, file)
        
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            
        new_content = content
        for regex, repl in replacements:
            new_content = regex.sub(repl, new_content)
            
        if content != new_content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)

# 2. File and Directory Renaming (Bottom-Up to avoid path breaking)
for root, dirs, files in os.walk(lib_dir, topdown=False):
    for name in files + dirs:
        if 'sensor' in name.lower():
            old_path = os.path.join(root, name)
            # Case preserving replace
            new_name = re.sub(r'sensor', 'tag', name)
            new_name = re.sub(r'Sensor', 'Tag', new_name)
            new_path = os.path.join(root, new_name)
            os.rename(old_path, new_path)

print("Refactoring complete.")
