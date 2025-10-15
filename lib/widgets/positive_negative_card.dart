import 'package:flutter/material.dart';
import '../models/mood_entry.dart';

class PositiveNegativeCard extends StatelessWidget {
  final List<MoodEntry> entries;

  const PositiveNegativeCard({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    final positiveDays =
        entries.where((entry) => _isPositive(entry.mood)).length;
    final negativeDays = entries.length - positiveDays;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Positive Days: $positiveDays',
          style: const TextStyle(fontSize: 18, color: Colors.green),
        ),
        Text(
          'Negative Days: $negativeDays',
          style: const TextStyle(fontSize: 18, color: Colors.red),
        ),
      ],
    );
  }

  bool _isPositive(String mood) {
    const positiveMoods = ['😊', '😄', '😍', '😎', '🎉'];
    return positiveMoods.contains(mood);
  }
}
