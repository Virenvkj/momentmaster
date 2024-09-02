import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/appointmentScreens/customIcons/blue_tick.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PreChooseDeadlineStartingDate extends StatefulWidget {
  const PreChooseDeadlineStartingDate({super.key});

  @override
  _PreChooseDeadlineStartingDateState createState() =>
      _PreChooseDeadlineStartingDateState();
}

class _PreChooseDeadlineStartingDateState
    extends State<PreChooseDeadlineStartingDate> {
  bool startDateFixed = false;
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
      showNavigationArrow: false,
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
          Navigator.of(context).pop();
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
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: const BlueTickIcon(),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: ListView(
          children: [
            AppConstants.sizer(0.025, 0, context),
            Text(
              AppStrings.areYouFamiliarWithThisStartingDate,
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
