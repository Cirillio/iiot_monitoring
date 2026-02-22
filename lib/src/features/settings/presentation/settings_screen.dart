import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/theme/theme_provider.dart';
import '../../../shared/widgets/iiot_switch.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Настройки',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
        ),
        backgroundColor: theme.colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IiotCard(
              usePadding: false,
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "Темная тема",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      LucideIcons.moon,
                      color: themeMode == ThemeMode.dark
                          ? Colors.cyan
                          : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    trailing: IIoTSwitch(
                      value: themeMode == ThemeMode.dark,
                      onChanged: (value) async {
                        await ref
                            .read(themeModeProvider.notifier)
                            .toggleTheme();
                      },
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),

                    onTap: () async {
                      await ref.read(themeModeProvider.notifier).toggleTheme();
                    },
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: themeMode == ThemeMode.dark
                          ? Colors.white.withValues(alpha: 0.125)
                          : theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Уведомления",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      _notificationsEnabled
                          ? LucideIcons.bellRing
                          : LucideIcons.bellOff,
                      color: _notificationsEnabled
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    trailing: IIoTSwitch(
                      value: _notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          _notificationsEnabled = value;
                        });
                      },
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(32),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _notificationsEnabled = !_notificationsEnabled;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
