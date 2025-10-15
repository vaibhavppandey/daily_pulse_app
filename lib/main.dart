import 'package:daily_pulse_app/app/app.dart';
import 'package:daily_pulse_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  await themeProvider.loadThemeMode();
  runApp(
    ChangeNotifierProvider.value(
      value: themeProvider,
      child: const DailyPulseApp(),
    ),
  );
}

