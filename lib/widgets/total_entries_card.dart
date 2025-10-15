import 'package:flutter/material.dart';
import '../models/mood_entry.dart';

class TotalEntriesCard extends StatelessWidget {
  final List<MoodEntry> entries;

  const TotalEntriesCard({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total Entries: ${entries.length}',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
