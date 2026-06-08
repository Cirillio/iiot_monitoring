import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../shared/widgets/iiot_card.dart';
import '../../../shared/widgets/iiot_switch.dart';
import '../../../shared/models/system/system_status.dart';
import 'controllers/system_notifier.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Система',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
        ),
        backgroundColor: theme.colorScheme.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _SectionTitle(title: 'Service Health'),
            const SizedBox(height: 8),
            const _ServiceHealthBlock(),
            const SizedBox(height: 24),

            const _SectionTitle(title: 'Collector Config'),
            const SizedBox(height: 8),
            const _CollectorConfigBlock(),
            const SizedBox(height: 24),

            const _SectionTitle(title: 'Data Lifecycle'),
            const SizedBox(height: 8),
            const _DataLifecycleBlock(),
            const SizedBox(height: 24),

            const _SectionTitle(title: 'App Preferences'),
            const SizedBox(height: 8),
            IiotCard(
              usePadding: false,
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Адрес подключения", style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(ref.watch(baseUrlProvider), style: const TextStyle(fontSize: 12)),
                    leading: Icon(
                      LucideIcons.network,
                      color: theme.colorScheme.primary,
                    ),
                    trailing: const Icon(LucideIcons.chevronRight),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                    onTap: () => _showEditUrlDialog(context, ref),
                  ),
                  _buildDivider(theme, themeMode),
                  ListTile(
                    title: const Text("Темная тема", style: TextStyle(fontWeight: FontWeight.w500)),
                    leading: Icon(
                      LucideIcons.moon,
                      color: themeMode == ThemeMode.dark ? Colors.cyan : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    trailing: IIoTSwitch(
                      value: themeMode == ThemeMode.dark,
                      onChanged: (value) async => await ref.read(themeModeProvider.notifier).toggleTheme(),
                    ),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                    onTap: () async => await ref.read(themeModeProvider.notifier).toggleTheme(),
                  ),
                  _buildDivider(theme, themeMode),
                  ListTile(
                    title: const Text("Уведомления", style: TextStyle(fontWeight: FontWeight.w500)),
                    leading: Icon(
                      _notificationsEnabled ? LucideIcons.bellRing : LucideIcons.bellOff,
                      color: _notificationsEnabled ? theme.colorScheme.primary : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    trailing: IIoTSwitch(
                      value: _notificationsEnabled,
                      onChanged: (value) => setState(() => _notificationsEnabled = value),
                    ),
                    onTap: () => setState(() => _notificationsEnabled = !_notificationsEnabled),
                  ),
                  _buildDivider(theme, themeMode),
                  ListTile(
                    title: const Text("Версия ПО", style: TextStyle(fontWeight: FontWeight.w500)),
                    leading: Icon(LucideIcons.info, color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                    trailing: const Text("v1.2.0-stable", style: TextStyle(color: Colors.grey)),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100), // Для FloatingBottomNavBar
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(ThemeData theme, ThemeMode themeMode) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: themeMode == ThemeMode.dark
            ? Colors.white.withValues(alpha: 0.1)
            : theme.colorScheme.surfaceContainerHighest,
      ),
    );
  }

  Future<void> _showEditUrlDialog(BuildContext context, WidgetRef ref) async {
    final currentUrl = ref.read(baseUrlProvider);
    final controller = TextEditingController(text: currentUrl);

    final newUrl = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Адрес подключения'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'http://10.0.2.2:5000',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.url,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('ОТМЕНА'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: const Text('СОХРАНИТЬ'),
          ),
        ],
      ),
    );

    if (newUrl != null && newUrl.isNotEmpty && newUrl != currentUrl) {
      await ref.read(baseUrlProvider.notifier).setUrl(newUrl);
    }
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}

class _ServiceHealthBlock extends ConsumerWidget {
  const _ServiceHealthBlock();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusAsync = ref.watch(systemStatusProvider);

    return IiotCard(
      child: statusAsync.when(
        data: (statuses) {
          final collector = statuses.firstWhere(
            (s) => s.serviceName == 'ModbusCollector',
            orElse: () => const SystemStatus(serviceName: 'ModbusCollector'),
          );

          Color statusColor;
          String statusText;
          switch (collector.status) {
            case ServiceStatus.online:
              statusColor = Colors.greenAccent;
              statusText = 'ONLINE';
              break;
            case ServiceStatus.degraded:
              statusColor = Colors.orangeAccent;
              statusText = 'DEGRADED';
              break;
            case ServiceStatus.criticalError:
            case ServiceStatus.offline:
              statusColor = Colors.redAccent;
              statusText = 'CRITICAL';
              break;
            default:
              statusColor = Colors.grey;
              statusText = 'UNKNOWN';
          }

          final duration = Duration(seconds: collector.uptimeSeconds);
          final uptimeStr = '${duration.inDays}д ${duration.inHours % 24}ч ${duration.inMinutes % 60}м';
          
          final syncDiff = DateTime.now().toUtc().difference(collector.lastSync ?? DateTime.now().toUtc());
          final syncStr = '${syncDiff.inSeconds} сек. назад';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Collector Status', style: TextStyle(fontSize: 16)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: statusColor.withValues(alpha: 0.5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          statusText,
                          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildInfoRow('Uptime', uptimeStr),
              const SizedBox(height: 8),
              _buildInfoRow('Last Sync', syncStr),
              if (collector.status != ServiceStatus.online && collector.lastError != null && collector.lastError!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    collector.lastError!,
                    style: const TextStyle(color: Colors.redAccent, fontSize: 12),
                  ),
                ),
              ],
            ],
          );
        },
        loading: () => const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
        error: (err, _) => Text('Error loading status: $err', style: const TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _CollectorConfigBlock extends ConsumerWidget {
  const _CollectorConfigBlock();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configAsync = ref.watch(systemConfigProvider);

    return IiotCard(
      child: configAsync.when(
        data: (config) {
          return Column(
            children: [
              _buildConfigRow('Интервал опроса (Polling)', '${config.pollingIntervalMs} мс'),
              const SizedBox(height: 12),
              _buildConfigRow('Мертвая зона (Deadband)', '${(config.deadbandThreshold * 100).toStringAsFixed(1)}%'),
              const SizedBox(height: 12),
              _buildConfigRow('Пульс данных (Heartbeat)', '${config.dataHeartbeatSec} с'),
            ],
          );
        },
        loading: () => const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
        error: (err, _) => Text('Error loading config: $err', style: const TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget _buildConfigRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}

class _DataLifecycleBlock extends ConsumerWidget {
  const _DataLifecycleBlock();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configAsync = ref.watch(systemConfigProvider);

    return IiotCard(
      child: configAsync.when(
        data: (config) {
          return Column(
            children: [
              _buildConfigRow('Детальные данные', '${config.rawRetentionDays} дней'),
              const SizedBox(height: 12),
              _buildConfigRow('Аналитика', '${config.aggRetentionDays} дней'),
            ],
          );
        },
        loading: () => const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
        error: (err, _) => Text('Error loading config: $err', style: const TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget _buildConfigRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}
