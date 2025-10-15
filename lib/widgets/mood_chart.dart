import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/mood_entry.dart';

class MoodChart extends StatelessWidget {
  final List<MoodEntry> entries;

  const MoodChart({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    final moodCounts = <String, int>{};
    for (var entry in entries) {
      moodCounts[entry.mood] = (moodCounts[entry.mood] ?? 0) + 1;
    }

    final chartData = moodCounts.entries
        .map((entry) => _ChartData(entry.key, entry.value.toDouble()))
        .toList();

    return SfCircularChart(
      title: ChartTitle(text: 'Mood Distribution'),
      legend: Legend(isVisible: true),
      series: <CircularSeries<_ChartData, String>>[
        PieSeries<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData data, _) => data.mood,
          yValueMapper: (_ChartData data, _) => data.count,
          dataLabelMapper: (_ChartData data, _) => '${data.mood} (${data.count.toInt()})',
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.mood, this.count);
  final String mood;
  final double count;
}
