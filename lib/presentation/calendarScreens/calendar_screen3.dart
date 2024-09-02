import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/bottom_sheet_service.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/domain/entities/bubble.dart';
import 'package:momentmaster/presentation/appointmentScreens/new_appointment.dart';
import 'package:momentmaster/presentation/calendarScreens/common/deadline_tracker_widget.dart';
import 'package:momentmaster/presentation/common/create_deadline.dart';
import 'package:momentmaster/presentation/common/floating_action_bubble.dart';
import 'package:momentmaster/presentation/common/settings_menu.dart';
import 'package:momentmaster/presentation/presentationScreens/view_presentation.dart';

class CalendarScreen3 extends StatefulWidget {
  const CalendarScreen3({super.key});

  @override
  _CalendarScreen3State createState() => _CalendarScreen3State();
}

class _CalendarScreen3State extends State<CalendarScreen3>
    with TickerProviderStateMixin {
  late int totalDaysinCurrentMonth;
  late Animation<double> _animation;
  late AnimationController _animationController;
  late ScrollController scrollController;
  late ScrollController scrollController2;

  int getDaysInMonth({required int month, required int year}) {
    // Handle the last month of the year by wrapping around to January of the next year
    int nextMonth = month % 12 + 1;
    int nextYear = nextMonth == 1 ? year + 1 : year;

    // Create a DateTime object for the first day of the next month
    DateTime firstDayNextMonth = DateTime(nextYear, nextMonth, 1);

    // Subtract one day to get the last day of the current month
    DateTime lastDayCurrentMonth =
        firstDayNextMonth.subtract(const Duration(days: 1));

    // Return the day component of the DateTime object, which represents the number of days in the month
    return lastDayCurrentMonth.day;
  }

  @override
  void initState() {
    totalDaysinCurrentMonth =
        getDaysInMonth(month: DateTime.now().month, year: DateTime.now().year);
    scrollController = ScrollController();
    scrollController2 = ScrollController();
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
    super.initState();
  }

  List<String> months = [
    AppStrings.january,
    AppStrings.february,
    AppStrings.march,
    AppStrings.april,
    AppStrings.may,
    AppStrings.jun,
    AppStrings.july,
    AppStrings.august,
    AppStrings.september,
    AppStrings.october,
    AppStrings.november,
    AppStrings.december
  ];

  String getMonths(int index) {
    return months[index].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionBubble(
          animatedIconData: AnimatedIcons.add_event,
          animation: _animation,
          backGroundColor: Colors.white,
          items: <Bubble>[
            AppConstants.getBubble(AppStrings.presentation, () {
              NavigationService2.navigate(
                  context, 'push', const ViewPresentation1());
            }, Icons.search),
            AppConstants.getBubble(AppStrings.newAppointment, () {
              NavigationService2.navigate(
                  context, 'push', const NewAppointment());
            }, Icons.event),
            AppConstants.getBubble(AppStrings.newDeadline, () {
              NavigationService2.navigate(
                  context, 'push', const CreateDeadline());
            }, Icons.flag),
          ],
          onPress: _animationController.isCompleted
              ? _animationController.reverse
              : _animationController.forward,
          iconColor: AppColors.primaryRed,
          iconData: Icons.add,
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.flag_outlined),
              color: AppColors.primaryGrey,
              onPressed: () {
                BottomSheetService.showBottomSheet(
                    context: context, child: const DeadLineTrackerWidget());
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              color: AppColors.primaryGrey,
              onPressed: () {
                NavigationService2.navigate(
                    context, 'push', const SettingsMenu());
              },
            ),
          ],
          title: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              '${DateTime.now().year} ${getMonths(DateTime.now().month - 1)}',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Quicksand',
              ),
            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.07,
              child: FlutterDatePickerTimeline(
                selectedItemWidth: MediaQuery.of(context).size.width * 0.15,
                itemRadius: MediaQuery.of(context).size.width * 0.15,
                selectedItemBackgroundColor: AppColors.primaryRed,
                selectedItemTextStyle: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                unselectedItemTextStyle: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  color: Color(0xffb6b6b6),
                  fontWeight: FontWeight.w500,
                ),
                startDate: DateTime.now(),
                endDate: DateTime.utc(DateTime.now().year, DateTime.now().month,
                    totalDaysinCurrentMonth),
                initialSelectedDate: DateTime.now(),
                onSelectedDateChange: (DateTime? dateTime) {},
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.flag),
                  onPressed: () {},
                  color: AppColors.primaryBlue,
                ),
                const Text(
                  'English test',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: Color(0xff3dbebe),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                IconButton(
                  icon: const Icon(Icons.circle),
                  onPressed: () {},
                  iconSize: 15,
                  color: AppColors.primaryBlue,
                ),
                const Text(
                  'Math test',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: Color(0xff3dbebe),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.16),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: AppColors.primaryGrey),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.7285,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: AppColors.primaryGrey,
                                  height: MediaQuery.of(context).size.height *
                                      0.0003,
                                ),
                                Text('07:00',
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyles.hourTimeLineStyle(context)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Container(
                                  color: AppColors.primaryGrey,
                                  height: MediaQuery.of(context).size.height *
                                      0.0003,
                                ),
                                Text('08:00',
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyles.hourTimeLineStyle(context)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Container(
                                  color: AppColors.primaryGrey,
                                  height: MediaQuery.of(context).size.height *
                                      0.0003,
                                ),
                                Text('09:00',
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyles.hourTimeLineStyle(context)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Container(
                                  color: AppColors.primaryGrey,
                                  height: MediaQuery.of(context).size.height *
                                      0.0003,
                                ),
                                Text('10:00',
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyles.hourTimeLineStyle(context)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff3DBEBE),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Mathtest',
                                        style: AppStyles.timeLineNameStyle(
                                            context),
                                        textAlign: TextAlign.left,
                                      ),
                                      IconButton(
                                          alignment: Alignment.centerRight,
                                          color: Colors.white,
                                          icon: const Icon(Icons.flag),
                                          onPressed: () {}),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          height: MediaQuery.of(context).size.height * 0.0003,
                        ),
                        Text('11:00',
                            textAlign: TextAlign.left,
                            style: AppStyles.hourTimeLineStyle(context)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          height: MediaQuery.of(context).size.height * 0.0003,
                        ),
                        Text('12:00',
                            textAlign: TextAlign.left,
                            style: AppStyles.hourTimeLineStyle(context)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          height: MediaQuery.of(context).size.height * 0.0003,
                        ),
                        Text('13:00',
                            textAlign: TextAlign.left,
                            style: AppStyles.hourTimeLineStyle(context)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          height: MediaQuery.of(context).size.height * 0.0003,
                        ),
                        Text('14:00',
                            textAlign: TextAlign.left,
                            style: AppStyles.hourTimeLineStyle(context)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          height: MediaQuery.of(context).size.height * 0.0003,
                        ),
                        Text('15:00',
                            textAlign: TextAlign.left,
                            style: AppStyles.hourTimeLineStyle(context)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: AppColors.primaryGrey,
                                  height: MediaQuery.of(context).size.height *
                                      0.0003,
                                ),
                                Text('16:00',
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyles.hourTimeLineStyle(context)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Container(
                                  color: AppColors.primaryGrey,
                                  height: MediaQuery.of(context).size.height *
                                      0.0003,
                                ),
                                Text('17:00',
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyles.hourTimeLineStyle(context)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Container(
                                  color: AppColors.primaryGrey,
                                  height: MediaQuery.of(context).size.height *
                                      0.0003,
                                ),
                                Text('18:00',
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyles.hourTimeLineStyle(context)),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff3DBEBE),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Meeting',
                                        style: AppStyles.timeLineNameStyle(
                                            context),
                                        textAlign: TextAlign.left,
                                      ),
                                      IconButton(
                                          alignment: Alignment.centerRight,
                                          color: Colors.white,
                                          icon: const Icon(Icons.flag),
                                          onPressed: () {}),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          height: MediaQuery.of(context).size.height * 0.0003,
                        ),
                        Text(
                          '19:00',
                          textAlign: TextAlign.left,
                          style: AppStyles.hourTimeLineStyle(context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          height: MediaQuery.of(context).size.height * 0.0003,
                        ),
                        Text(
                          '20:00',
                          textAlign: TextAlign.left,
                          style: AppStyles.hourTimeLineStyle(context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
