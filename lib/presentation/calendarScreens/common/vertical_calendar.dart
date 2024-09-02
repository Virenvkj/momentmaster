import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momentmaster/domain/month.dart';
import 'package:momentmaster/domain/week.dart';

class VerticalCalendar extends StatefulWidget {
  final DateTime minDate;
  final DateTime maxDate;
  final MonthBuilder monthBuilder;
  final DayBuilder dayBuilder;
  final DateTime? initialMinDate;
  final DateTime? initialMaxDate;
  final ValueChanged<DateTime>? onDayPressed;
  final PeriodChanged? onRangeSelected;
  final EdgeInsetsGeometry? listPadding;

  VerticalCalendar(
      {super.key,
      required this.minDate,
      required this.maxDate,
      required this.monthBuilder,
      required this.dayBuilder,
      this.onDayPressed,
      this.onRangeSelected,
      this.initialMinDate,
      this.initialMaxDate,
      this.listPadding})
      : assert(minDate.isBefore(maxDate));

  @override
  _VerticalCalendarState createState() => _VerticalCalendarState();
}

class _VerticalCalendarState extends State<VerticalCalendar> {
  late DateTime _minDate;
  late DateTime _maxDate;
  late List<Month> _months;
  late DateTime? rangeMinDate;
  late DateTime? rangeMaxDate;

  List<Week> _getWeeksInMonth(int year, int month) {
    List<Week> weeks = [];

    DateTime firstDayOfMonth = DateTime(year, month, 1);
    DateTime lastDayOfMonth =
        DateTime(year, month + 1, 0); // Last day of the month

    DateTime firstDayOfWeek = firstDayOfMonth;
    DateTime lastDayOfWeek = firstDayOfWeek
        .add(Duration(days: DateTime.daysPerWeek - firstDayOfWeek.weekday));

    while (firstDayOfWeek.isBefore(lastDayOfMonth) ||
        firstDayOfWeek.isAtSameMomentAs(lastDayOfMonth)) {
      if (lastDayOfWeek.isAfter(lastDayOfMonth)) {
        lastDayOfWeek = lastDayOfMonth;
      }

      weeks.add(Week(firstDay: firstDayOfWeek, lastDay: lastDayOfWeek));

      // Move to the next week
      firstDayOfWeek = lastDayOfWeek.add(const Duration(days: 1));
      lastDayOfWeek =
          firstDayOfWeek.add(const Duration(days: DateTime.daysPerWeek - 1));
    }

    return weeks;
  }

  List<Month> getMonthsBetween(DateTime start, DateTime end) {
    List<Month> months = [];

    if (start.isAfter(end)) {
      DateTime temp = start;
      start = end;
      end = temp;
    }

    DateTime current = DateTime(start.year, start.month);
    while (current.isBefore(DateTime(end.year, end.month + 1, 1))) {
      int year = current.year;
      int month = current.month;
      int daysInMonth =
          DateTime(year, month + 1, 0).day; // Last day of the month

      List<Week> weeks = _getWeeksInMonth(year, month);

      months.add(
          Month(year: year, month: month, days: daysInMonth, weeks: weeks));

      // Move to the next month
      current = DateTime(current.year, current.month + 1);
    }

    return months;
  }

  @override
  void initState() {
    super.initState();
    _months = getMonthsBetween(widget.minDate, widget.maxDate);
    _minDate = widget.minDate;
    _maxDate = widget.maxDate;
    rangeMinDate = widget.initialMinDate ?? DateTime.now();
    rangeMaxDate = widget.initialMaxDate ?? DateTime.now();
  }

  @override
  void didUpdateWidget(VerticalCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.minDate != widget.minDate ||
        oldWidget.maxDate != widget.maxDate) {
      _months = getMonthsBetween(widget.minDate, widget.maxDate);
      _minDate = widget.minDate;
      _maxDate = widget.maxDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              cacheExtent:
                  (MediaQuery.of(context).size.width / DateTime.daysPerWeek) *
                      6,
              padding: widget.listPadding ?? EdgeInsets.zero,
              itemCount: _months.length,
              itemBuilder: (BuildContext context, int position) {
                return _MonthView(
                    month: _months[position],
                    minDate: _minDate,
                    maxDate: _maxDate,
                    monthBuilder: widget.monthBuilder,
                    dayBuilder: widget.dayBuilder,
                    onDayPressed: widget.onRangeSelected != null
                        ? (DateTime date) {
                            if (rangeMinDate == null || rangeMaxDate != null) {
                              setState(() {
                                rangeMinDate = date;
                                rangeMaxDate = null;
                              });
                            } else if (date.isBefore(rangeMinDate!)) {
                              setState(() {
                                rangeMaxDate = rangeMinDate;
                                rangeMinDate = date;
                              });
                            } else if (date
                                .isAfter(rangeMinDate ?? DateTime.now())) {
                              setState(() {
                                rangeMaxDate = date;
                              });
                            }

                            widget.onRangeSelected!(
                                rangeMinDate ?? DateTime.now(),
                                rangeMaxDate ?? DateTime.now());

                            if (widget.onDayPressed != null) {
                              widget.onDayPressed!(date);
                            }
                          }
                        : widget.onDayPressed,
                    rangeMinDate: rangeMinDate ?? DateTime.now(),
                    rangeMaxDate: rangeMaxDate ?? DateTime.now());
              }),
        ),
      ],
    );
  }
}

class _MonthView extends StatelessWidget {
  final Month month;
  final DateTime minDate;
  final DateTime maxDate;
  final MonthBuilder? monthBuilder;
  final DayBuilder? dayBuilder;
  final ValueChanged<DateTime>? onDayPressed;
  final DateTime? rangeMinDate;
  final DateTime? rangeMaxDate;

  const _MonthView(
      {required this.month,
      required this.minDate,
      required this.maxDate,
      this.monthBuilder,
      this.dayBuilder,
      this.onDayPressed,
      this.rangeMinDate,
      this.rangeMaxDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        monthBuilder != null
            ? monthBuilder!(context, month.month, month.year)
            : _DefaultMonthView(month: month.month, year: month.year),
        Table(
          children: month.weeks
              .map((Week week) => _generateFor(context, week))
              .toList(growable: false),
        ),
      ],
    );
  }

  TableRow _generateFor(BuildContext context, Week week) {
    DateTime firstDay = week.firstDay;
    bool rangeFeatureEnabled = rangeMinDate != null;

    return TableRow(
        children: List<Widget>.generate(DateTime.daysPerWeek, (int position) {
      DateTime day = DateTime(week.firstDay.year, week.firstDay.month,
          firstDay.day + (position - (firstDay.weekday - 1)));

      if ((position + 1) < week.firstDay.weekday ||
          (position + 1) > week.lastDay.weekday ||
          day.isBefore(minDate) ||
          day.isAfter(maxDate)) {
        return const SizedBox();
      } else {
        bool isSelected = false;

        if (rangeFeatureEnabled) {
          if (rangeMinDate != null && rangeMaxDate != null) {
            isSelected = day.isAfter(rangeMinDate ?? DateTime.now()) &&
                day.isBefore(rangeMaxDate ?? DateTime.now());
          } else {
            isSelected = day.isAtSameMomentAs(rangeMinDate ?? DateTime.now());
          }
        }

        return AspectRatio(
            aspectRatio: 1.0,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onDayPressed != null
                  ? () {
                      if (onDayPressed != null) {
                        onDayPressed!(day);
                      }
                    }
                  : null,
              child: dayBuilder != null
                  ? dayBuilder!(context, day, isSelected: isSelected)
                  : _DefaultDayView(date: day, isSelected: isSelected),
            ));
      }
    }, growable: false));
  }
}

class _DefaultMonthView extends StatelessWidget {
  final int month;
  final int year;

  const _DefaultMonthView({required this.month, required this.year});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        DateFormat('MMMM yyyy').format(DateTime(year, month)),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

class _DefaultDayView extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const _DefaultDayView({required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: isSelected == true ? Colors.red : Colors.white,
          shape: BoxShape.circle),
      child: Center(
        child: Text(
          DateFormat('d').format(date),
        ),
      ),
    );
  }
}

typedef MonthBuilder = Widget Function(
    BuildContext context, int month, int year);
typedef DayBuilder = Widget Function(BuildContext context, DateTime date,
    {bool isSelected});
typedef PeriodChanged = void Function(DateTime minDate, DateTime maxDate);
