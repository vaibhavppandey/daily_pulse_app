import 'package:daily_pulse_app/widgets/frequent_mood_card.dart';
import 'package:daily_pulse_app/widgets/positive_negative_card.dart';
import 'package:daily_pulse_app/widgets/total_entries_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mood_provider.dart';

class MoodAnalyticsPage extends StatefulWidget {
  const MoodAnalyticsPage({super.key});

  @override
  State<MoodAnalyticsPage> createState() => _MoodAnalyticsPageState();
}

class _MoodAnalyticsPageState extends State<MoodAnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Analytics'),
      ),
      body: Consumer<MoodProvider>(
        builder: (context, moodProvider, child) {
          final entries = moodProvider.entries;

          if (entries.isEmpty) {
            return const Center(
              child: Text('No mood entries yet.'),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TotalEntriesCard(entries: entries),
                const SizedBox(height: 16),
                PositiveNegativeCard(entries: entries),
                const SizedBox(height: 16),
                FrequentMoodCard(entries: entries),
              ],
            ),
          );
        },
      ),
    );
  }
}