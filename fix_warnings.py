import os
import re

def fix_file(filepath, replacements):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    new_content = content
    for pattern, repl in replacements:
        new_content = re.sub(pattern, repl, new_content)
    if content != new_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)

lib_dir = '/home/cirillio/web/csharp/IIoT/iiot_monitoring/lib'

repls = [
    (r'device\.name\s*\?\?\s*\'[^\']*\'', r'device.name'),
    (r'device\.ipAddress\s*\?\?\s*\'[^\']*\'', r'device.ipAddress'),
    (r'tag\.name\s*!=\s*null\s*\?', r'true ?'),
    (r'tag\.name!', r'tag.name'),
    (r'tag\.unit\s*\?\?\s*\'\'', r'tag.unit'),
]

for root, dirs, files in os.walk(lib_dir):
    for file in files:
        if not file.endswith('.dart'): continue
        filepath = os.path.join(root, file)
        fix_file(filepath, repls)

print("Warnings fixed.")
