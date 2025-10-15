import 'dart:convert';

class MoodEntry {
  final DateTime date;
  final String mood;
  final String note;

  MoodEntry({
    required this.date,
    required this.mood,
    this.note = '',
  });

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'mood': mood,
        'note': note,
      };

  factory MoodEntry.fromJson(Map<String, dynamic> json) => MoodEntry(
        date: DateTime.parse(json['date']),
        mood: json['mood'],
        note: json['note'],
      );

  static String encode(List<MoodEntry> entries) => json.encode(
        entries
            .map<Map<String, dynamic>>((entry) => entry.toJson())
            .toList(),
      );

  static List<MoodEntry> decode(String entries) =>
      (json.decode(entries) as List<dynamic>)
          .map<MoodEntry>((item) => MoodEntry.fromJson(item))
          .toList();
}
