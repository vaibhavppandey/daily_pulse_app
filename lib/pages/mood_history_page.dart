import 'package:daily_pulse_app/widgets/mood_history_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mood_provider.dart';

class MoodHistoryPage extends StatefulWidget {
  const MoodHistoryPage({super.key});

  @override
  State<MoodHistoryPage> createState() => _MoodHistoryPageState();
}

class _MoodHistoryPageState extends State<MoodHistoryPage> {
  Future<void> _selectDate(BuildContext context) async {
    final moodProvider = Provider.of<MoodProvider>(context, listen: false);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: moodProvider.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != moodProvider.selectedDate) {
      moodProvider.setSelectedDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodProvider>(
      builder: (context, moodProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Mood History'),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Entries for: ${moodProvider.selectedDate.toLocal().toString().split(' ')[0]}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: moodProvider.selectedEntries.isEmpty
                    ? const Center(child: Text('No entries for this day.'))
                    : ListView.builder(
                        itemCount: moodProvider.selectedEntries.length,
                        itemBuilder: (context, index) {
                          final entry = moodProvider.selectedEntries[index];
                          return MoodHistoryCard(entry: entry);
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
