import 'package:flutter/material.dart';
import '../models/mood_entry.dart';

class FrequentMoodCard extends StatelessWidget {
  final List<MoodEntry> entries;

  const FrequentMoodCard({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const SizedBox.shrink();
    }

    final moodCounts = <String, int>{};
    for (final entry in entries) {
      moodCounts[entry.mood] = (moodCounts[entry.mood] ?? 0) + 1;
    }

    final mostFrequentMood = moodCounts.entries.reduce(
      (a, b) => a.value > b.value ? a : b,
    );

    return Row(
      children: [
        const Text(
          'Most Frequent Mood: ',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          mostFrequentMood.key,
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
