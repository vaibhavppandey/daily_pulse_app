import 'package:daily_pulse_app/models/mood_entry.dart';
import 'package:flutter/material.dart';

class MoodHistoryCard extends StatelessWidget {
  const MoodHistoryCard({super.key, required this.entry});

  final MoodEntry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: ListTile(
        leading: Text(
          entry.mood,
          style: const TextStyle(fontSize: 24),
        ),
        title: Text(
          '${entry.date.hour}:${entry.date.minute.toString().padLeft(2, '0')}',
        ),
        subtitle: entry.note.isNotEmpty ? Text(entry.note) : null,
      ),
    );
  }
}
