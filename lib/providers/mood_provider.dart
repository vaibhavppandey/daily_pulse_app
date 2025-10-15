import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/mood_entry.dart';

class MoodProvider with ChangeNotifier {
  List<MoodEntry> _entries = [];

  List<MoodEntry> get entries => _entries;

  Future<void> loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final existingEntries = prefs.getString('mood_entries') ?? '[]';
    _entries = MoodEntry.decode(existingEntries);
    notifyListeners();
  }

  Future<void> addEntry(String mood, String note) async {
    final newEntry = MoodEntry(
      date: DateTime.now(),
      mood: mood,
      note: note,
    );
    _entries.add(newEntry);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mood_entries', MoodEntry.encode(_entries));
    notifyListeners();
  }
}
