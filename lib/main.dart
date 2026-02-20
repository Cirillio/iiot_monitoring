import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/storage/prefs_provider.dart';
import 'src/core/theme/app_theme.dart';
import 'src/features/main/presentation/main_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация SharedPreferences до запуска runApp
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const IiotMonitoringApp(),
    ),
  );
}

class IiotMonitoringApp extends StatelessWidget {
  const IiotMonitoringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IIoT Monitoring',
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MainLayout(),
    );
  }
}
