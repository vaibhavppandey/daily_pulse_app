import 'package:daily_pulse_app/pages/login_signup_page.dart';
import 'package:daily_pulse_app/providers/auth_provider.dart';
import 'package:daily_pulse_app/providers/mood_provider.dart';
import 'package:daily_pulse_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyPulseApp extends StatefulWidget {
  const DailyPulseApp({super.key});

  @override
  State<DailyPulseApp> createState() => _DailyPulseAppState();
}

class _DailyPulseAppState extends State<DailyPulseApp> {
  late final ThemeProvider _themeProvider;

  @override
  void initState() {
    super.initState();
    _themeProvider = ThemeProvider();
    _themeProvider.loadThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MoodProvider()),
        ChangeNotifierProvider.value(value: _themeProvider),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Daily Pulse',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: themeProvider.themeMode,
            home: const LoginSignupPage(),
          );
        },
      ),
    );
  }
}