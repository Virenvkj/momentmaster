import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/calendarScreens/common/linear_progress_bar.dart';
import 'package:momentmaster/presentation/deadline/choose_deadline_time.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ChooseDeadlineDate extends StatefulWidget {
  const ChooseDeadlineDate({super.key});

  @override
  _ChooseDeadlineDateState createState() => _ChooseDeadlineDateState();
}

class _ChooseDeadlineDateState extends State<ChooseDeadlineDate> {
  List<int> upcomingMonths = [];
  bool dateSelected = false;
  late int currentMonth;
  List<Widget> calendars = [];

  ViewHeaderStyle dayStyle() {
    return ViewHeaderStyle(
        dateTextStyle: AppStyles.calendarDateStyle(context),
        dayTextStyle: AppStyles.calendarDayStyle(context),
        backgroundColor: AppColors.whiteColor);
  }

  void getMonths() {
    upcomingMonths.clear();
    currentMonth = DateTime.now().month;
    for (int i = currentMonth; i <= 12; i++) {
      upcomingMonths.add(i);
    }
  }

  List<Widget> getCalendarList() {
    calendars.clear();
    for (int b = 0; b < upcomingMonths.length; b++) {
      calendars.add(getCalendar(b));
    }
    return calendars;
  }

  Widget getCalendar(int month) {
    return SfCalendar(
      headerStyle: CalendarHeaderStyle(
        textStyle: AppStyles.calendarText(context),
      ),
      selectionDecoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.primaryBlue, width: 2),
        shape: BoxShape.circle,
      ),
      initialDisplayDate:
          DateTime.utc(DateTime.now().year, DateTime.now().month + month),
      firstDayOfWeek: 1,
      todayTextStyle: const TextStyle(fontSize: 15),
      minDate: DateTime.now(),
      viewHeaderHeight: 40,
      viewHeaderStyle: dayStyle(),
      cellBorderColor: AppColors.whiteColor,
      todayHighlightColor: AppColors.primaryRed,
      view: CalendarView.month,
      onTap: (val) {
        setState(() {
          NavigationService2.navigate(
              context, 'pushRep', const ChooseDeadlineTime());
        });
      },
    );
  }

  @override
  void initState() {
    getMonths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: ListView(
          shrinkWrap: true,
          children: [
            AppConstants.sizer(0.05, 0, context),
            const LinearProgressBar(
              value: 0.15,
            ),
            AppConstants.sizer(0.025, 0, context),
            Text(
              AppStrings.chooseTestDate,
              style: AppStyles.quickSandText22Black(context),
              textAlign: TextAlign.center,
            ),
            AppConstants.sizer(0.025, 0, context),
            Column(
              children: getCalendarList(),
            ),
          ],
        ),
      ),
    );
  }
}
