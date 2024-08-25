import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/calendarScreens/common/linearProgressBar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ChooseDeadlineStartingDate extends StatefulWidget {
  const ChooseDeadlineStartingDate({super.key});

  @override
  _ChooseDeadlineStartingDateState createState() =>
      _ChooseDeadlineStartingDateState();
}

class _ChooseDeadlineStartingDateState
    extends State<ChooseDeadlineStartingDate> {
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
    return SfDateRangePicker(
      enableMultiView: false,
      allowViewNavigation: false,
      navigationDirection: DateRangePickerNavigationDirection.horizontal,
      startRangeSelectionColor: AppColors.primaryBlue,
      endRangeSelectionColor: AppColors.primaryBlue,
      minDate: DateTime.now(),
      showNavigationArrow: false,
      initialDisplayDate:
          DateTime.utc(DateTime.now().year, DateTime.now().month + month),
      headerStyle: DateRangePickerHeaderStyle(
        textStyle: AppStyles.calendarText(context),
      ),
      todayHighlightColor: AppColors.primaryRed,
      selectionColor: AppColors.primaryBlue,
      rangeSelectionColor: AppColors.primaryBlue,
      backgroundColor: AppColors.whiteColor,
      selectionMode: DateRangePickerSelectionMode.range,
      onSelectionChanged: (DateRangePickerSelectionChangedArgs val) {
        PickerDateRange pickerDateRange = val.value;
        print(pickerDateRange.startDate);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              children: [
                AppConstants.sizer(0.05, 0, context),
                const LinearProgressBar(
                  value: 1.0,
                ),
                AppConstants.sizer(0.025, 0, context),
                Text(
                  AppStrings.areYouFamiliarWithThisStartingDate,
                  style: AppStyles.quickSandText22Black(context),
                  textAlign: TextAlign.center,
                ),
                AppConstants.sizer(0.025, 0, context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.62,
                  child: SingleChildScrollView(
                    child: Column(
                      children: getCalendarList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 15, top: 15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: AppColors.primaryBlue,
              ),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.height * 0.35,
                    margin: startDateFixed
                        ? const EdgeInsets.only(left: 280)
                        : const EdgeInsets.only(right: 280),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          startDateFixed = !startDateFixed;
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 70,
                          height: 100,
                          child: Icon(
                            Icons.check,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                        AppConstants.sizer(0, 0.1, context),
                        Text(
                          AppStrings.createSchedule,
                          style: AppStyles.robotoBlueColor_Size18(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
