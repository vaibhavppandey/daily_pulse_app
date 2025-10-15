
import 'package:daily_pulse_app/pages/login_signup_page.dart';
import 'package:daily_pulse_app/providers/auth_provider.dart';
import 'package:daily_pulse_app/providers/mood_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyPulseApp extends StatelessWidget {
  const DailyPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MoodProvider()),
      ],
      child: MaterialApp(
        title: 'Daily Pulse',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginSignupPage(),
      ),
    );
  }
}