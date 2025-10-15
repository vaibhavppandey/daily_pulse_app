import 'package:flutter/material.dart';

class MoodSelection extends StatelessWidget {
  const MoodSelection({
    super.key,
    required this.moods,
    required this.selectedMood,
    required this.onMoodSelected,
  });

  final List<String> moods;
  final String? selectedMood;
  final ValueChanged<String> onMoodSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: moods.map((mood) {
          final isSelected = selectedMood == mood;
          return GestureDetector(
            onTap: () => onMoodSelected(mood),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).primaryColor.withOpacity(0.3)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                mood,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
