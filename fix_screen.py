import os
import re

file_path = '/home/cirillio/web/csharp/IIoT/iiot_monitoring/lib/src/features/settings/presentation/settings_screen.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

content = re.sub(r'systemStatusNotifierProvider', 'systemStatusProvider', content)
content = re.sub(r'systemConfigNotifierProvider', 'systemConfigProvider', content)

lines = content.split('\n')
while lines and lines[-1].strip() in [';', '}', '']:
    if lines[-1].strip() == ';':
        lines.pop()
    elif lines[-1].strip() == '}':
        # Need to be careful not to delete valid closing braces
        # Let's count them
        pass
    else:
        pass
    break # don't touch for now

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)
