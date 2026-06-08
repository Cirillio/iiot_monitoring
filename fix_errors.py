import os
import re

lib_dir = '/home/cirillio/web/csharp/IIoT/iiot_monitoring/lib'

def fix_file(filepath, replacements):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    new_content = content
    for pattern, repl in replacements:
        new_content = re.sub(pattern, repl, new_content)
    if content != new_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)

# mapper.dart
mapper_path = os.path.join(lib_dir, 'src/features/dashboard/data/mapper.dart')
fix_file(mapper_path, [
    (r'slaveId: dto.slaveId,\n\s*isActive: dto.isActive,', 
     r'slaveId: dto.slaveId,\n      isActive: dto.isActive,\n      connectionId: dto.connectionId,\n      useGroupPolling: dto.useGroupPolling,\n      maxRegisterSpan: dto.maxRegisterSpan,\n      isOnline: dto.isOnline,')
])

# mock_device_data.dart
mock_path = os.path.join(lib_dir, 'src/features/device_detail/data/mock_device_data.dart')
fix_file(mock_path, [
    (r'dataType:\s*0', r'dataType: TagDataType.analogRaw'),
    (r'dataType:\s*1', r'dataType: TagDataType.digital'),
    (r'dataType:\s*2', r'dataType: TagDataType.analogPhysical'),
    (r'isActive: true,', r'isActive: true,\n      connectionId: 1,\n      isOnline: true,'),
    (r"import 'package:iiot_monitoring/src/shared/models/tag_ui_config.dart';", r"import 'package:iiot_monitoring/src/shared/models/tag_ui_config.dart';\nimport 'package:iiot_monitoring/src/shared/models/enums.dart';")
])

# Null aware operators and TagDataType checks across files
for root, dirs, files in os.walk(lib_dir):
    for file in files:
        if not file.endswith('.dart'): continue
        filepath = os.path.join(root, file)
        
        repls = [
            # tagDataType == 1 -> tagDataType == TagDataType.digital
            (r'dataType\s*==\s*1', r'dataType == TagDataType.digital'),
            (r'dataType\s*!=\s*1', r'dataType != TagDataType.digital'),
            (r'dataType\s*==\s*0', r'dataType == TagDataType.analogRaw'),
            
            # Dead code on Device string fields since they have defaults now
            (r'domainDevice\.name\s*\?\?\s*"[^"]*"', r'domainDevice.name'),
            (r'domainDevice\.ipAddress\s*\?\?\s*"[^"]*"', r'domainDevice.ipAddress'),
            (r'device\.name\s*\?\?\s*"[^"]*"', r'device.name'),
            (r'device\.ipAddress\s*\?\?\s*"[^"]*"', r'device.ipAddress'),
            
            # Dead code on Tag string fields
            (r'tag\.name\s*\?\?\s*"[^"]*"', r'tag.name'),
            (r'tag\.name\s*!=\s*null\s*\?\s*tag\.name!\s*:\s*"[^"]*"', r'tag.name'),
            (r'tag\.unit\s*\?\?\s*\'\'', r'tag.unit'),
            
            # withOpacity -> withValues(alpha: ...)
            (r'\.withOpacity\(([^)]+)\)', r'.withValues(alpha: \1)'),
        ]
        
        fix_file(filepath, repls)

print("Errors fixed.")
