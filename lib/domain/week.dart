class Week {
  final DateTime firstDay;
  final DateTime lastDay;

  Week({required this.firstDay, required this.lastDay});

  @override
  String toString() {
    return 'Week(firstDay: $firstDay, lastDay: $lastDay)';
  }
}
