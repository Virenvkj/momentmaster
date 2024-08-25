import 'package:momentmaster/domain/week.dart';

class Month {
  final int year;
  final int month;
  final int days;
  final List<Week> weeks;

  Month({
    required this.year,
    required this.month,
    required this.days,
    required this.weeks,
  });

  @override
  String toString() {
    return 'Month(year: $year, month: $month, days: $days, weeks: $weeks)';
  }
}
