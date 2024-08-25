import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/domain/entities/bubble.dart';
import 'package:momentmaster/presentation/appointmentScreens/new_appointment.dart';
import 'package:momentmaster/presentation/calendarScreens/calendar_screen2.dart';
import 'package:momentmaster/presentation/common/create_deadline.dart';
import 'package:momentmaster/presentation/common/floating_action_bubble.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen1 extends StatefulWidget {
  const CalendarScreen1({super.key});

  @override
  _CalendarScreen1State createState() => _CalendarScreen1State();
}

class _CalendarScreen1State extends State<CalendarScreen1>
    with TickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<double?> _animation;
  List<int> upcomingMonths = [];
  bool dateSelected = false;
  late int currentMonth;
  List<Widget> calendars = [];

  ViewHeaderStyle dayStyle() {
    return ViewHeaderStyle(
      dateTextStyle: AppStyles.calendarDateStyle(context),
      dayTextStyle: AppStyles.calendarDayStyle(context),
      backgroundColor: AppColors.whiteColor,
    );
  }

  void forAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);

    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  void initState() {
    forAnimation();
    getMonths();
    super.initState();
  }

  Bubble getBubble(String text, Function() onClick, IconData icon) {
    return Bubble(
      title: text,
      iconColor: AppColors.primaryBlue,
      bubbleColor: AppColors.whiteColor,
      icon: icon,
      titleStyle: const TextStyle(fontSize: 16, color: AppColors.whiteColor),
      onPress: onClick,
    );
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

  TextStyle dateStyle() {
    return AppStyles.calendarDateStyle(context);
  }

  Widget getCalendar(int month) {
    return SfCalendar(
      // onPressLeft: () {
      //   BottomSheetService.showBottomSheet(
      //       context: context, child: DeadLineTrackerWidget());
      // },
      // onPressRight: () {
      //   NavigationService2.navigate(context, 'push', SettingsMenu());
      // },
      allowViewNavigation: false,
      showNavigationArrow: month == 0 ? true : false,
      appointmentTextStyle: dateStyle(),
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
      minDate: DateTime.now(),
      viewHeaderHeight: 40,
      viewHeaderStyle: dayStyle(),
      cellBorderColor: AppColors.whiteColor,
      todayHighlightColor: AppColors.primaryRed,
      view: CalendarView.month,
      onTap: (val) {
        setState(
          () {
            NavigationService2.navigate(
              context,
              'push',
              const CalendarScreen2(),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: getCalendarList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionBubble(
        animatedIconData: AnimatedIcons.add_event,
        animation: _animation,
        backGroundColor: Colors.white,
        items: <Bubble>[
          getBubble(AppStrings.newAppointment, () {
            NavigationService2.navigate(
                context, 'push', const NewAppointment());
          }, Icons.event),
          getBubble(
            AppStrings.newDeadline,
            () {
              NavigationService2.navigate(
                  context, 'push', const CreateDeadline());
            },
            Icons.flag,
          ),
        ],
        onPress: _animationController.isCompleted
            ? _animationController.reverse
            : _animationController.forward,
        iconColor: AppColors.primaryRed,
        iconData: Icons.add,
      ),
    );
  }
}
