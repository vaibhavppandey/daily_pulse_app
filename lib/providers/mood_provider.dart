import 'package:daily_pulse_app/firebase/db.dart';
import 'package:flutter/material.dart';
import '../models/mood_entry.dart';

class MoodProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<MoodEntry> _entries = [];
  DateTime _selectedDate = DateTime.now();

  List<MoodEntry> get entries => _entries;
  DateTime get selectedDate => _selectedDate;

  List<MoodEntry> get selectedEntries => _entries
      .where((entry) =>
          entry.date.year == _selectedDate.year &&
          entry.date.month == _selectedDate.month &&
          entry.date.day == _selectedDate.day)
      .toList();

  Future<void> loadEntries() async {
    _entries = await _firestoreService.getEntries();
    notifyListeners();
  }

  Future<void> addEntry(String mood, String note) async {
    final newEntry = MoodEntry(
      date: DateTime.now(),
      mood: mood,
      note: note,
    );
    await _firestoreService.addEntry(newEntry);
    _entries.add(newEntry);
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}
