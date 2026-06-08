import os
import re

files_to_fix = [
    'lib/src/core/monitoring/tag_evaluator.dart',
    'lib/src/features/dashboard/presentation/widgets/tag_card.dart',
    'lib/src/features/device_detail/presentation/device_detail_screen.dart',
    'lib/src/features/device_detail/presentation/widgets/expanded_tag_card.dart'
]

import_str = "import 'package:iiot_monitoring/src/shared/models/enums.dart';\n"

for fpath in files_to_fix:
    full_path = os.path.join('/home/cirillio/web/csharp/IIoT/iiot_monitoring', fpath)
    with open(full_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if 'enums.dart' not in content:
        # Insert after the first import
        new_content = re.sub(r"(import '[^']+';\n)", r"\1" + import_str, content, count=1)
        with open(full_path, 'w', encoding='utf-8') as f:
            f.write(new_content)

print("Imports added.")
