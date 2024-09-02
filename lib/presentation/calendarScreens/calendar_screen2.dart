import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/bottom_sheet_service.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/domain/entities/bubble.dart';
import 'package:momentmaster/presentation/appointmentScreens/new_appointment.dart';
import 'package:momentmaster/presentation/calendarScreens/calendar_screen3.dart';
import 'package:momentmaster/presentation/common/create_deadline.dart';
import 'package:momentmaster/presentation/common/floating_action_bubble.dart';
import 'package:momentmaster/presentation/common/settings_menu.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import 'common/deadline_tracker_widget.dart';

class CalendarScreen2 extends StatefulWidget {
  const CalendarScreen2({super.key});

  @override
  _CalendarScreen2State createState() => _CalendarScreen2State();
}

class _CalendarScreen2State extends State<CalendarScreen2>
    with TickerProviderStateMixin {
  late CalendarController calendarController;
  late ScrollController scrollController;
  late DateTime todayDate;
  late Animation<double> _animation;
  late AnimationController _animationController;

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
    todayDate = DateTime.now();
    forAnimation();
    calendarController = CalendarController();
    scrollController = ScrollController();

    super.initState();
  }

  TextStyle dateStyle(FontWeight fontWeight) {
    return AppStyles.calendarDateStyle(context);
  }

  DaysOfWeekStyle dayStyle() {
    return DaysOfWeekStyle(
        weekdayStyle: AppStyles.calendarDayStyle(context),
        weekendStyle: AppStyles.calendarDayStyle(context));
  }

  List<Widget> tabBarView = [];

  List<Widget> getTabBarViewChildren() {
    tabBarView.clear();
    for (int i = 0; i < 12; i++) {
      tabBarView.add(
        TableCalendar(
          firstDay: DateTime.now(),
          focusedDay: DateTime.now(),
          lastDay: DateTime.now(),
          startingDayOfWeek: StartingDayOfWeek.monday,
          daysOfWeekStyle: dayStyle(),
          headerVisible: false,
          headerStyle: const HeaderStyle(
            rightChevronMargin: EdgeInsets.all(2),
            leftChevronMargin: EdgeInsets.all(2),
            headerPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            leftChevronVisible: false,
            rightChevronVisible: false,
            formatButtonVisible: false,
            titleTextStyle: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25,
              color: Color(0xff3dbebe),
            ),
          ),
          // calendarController: calendarController,
          calendarStyle: const CalendarStyle(
              // todayColor: AppColors.primaryRed,
              // selectedColor: AppColors.primaryRed,
              // weekdayStyle: dateStyle(FontWeight.normal),
              // weekendStyle: dateStyle(FontWeight.normal),
              ),
        ),
      );
      //calendarController.nextPage();
    }
    return tabBarView;
  }

  Bubble getBubble(String text, Function() onClick, IconData icon) {
    return Bubble(
      title: text,
      iconColor: AppColors.primaryBlue,
      bubbleColor: Colors.white,
      icon: icon,
      titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
      onPress: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          getBubble(AppStrings.newDeadline, () {
            NavigationService2.navigate(
                context, 'push', const CreateDeadline());
          }, Icons.flag_outlined),
        ],
        onPress: _animationController.isCompleted
            ? _animationController.reverse
            : _animationController.forward,
        iconColor: AppColors.primaryRed,
        iconData: Icons.add,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: DefaultTabController(
              initialIndex: DateTime.now().month - 1,
              length: 12,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.flag_outlined),
                      color: AppColors.primaryGrey,
                      onPressed: () {
                        setState(() {
                          BottomSheetService.showBottomSheet(
                              context: context,
                              child: const DeadLineTrackerWidget());
                        });
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
                  title: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '${DateTime.now().year}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.all(0),
                    labelPadding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                    labelColor: const Color(0xff3DBEBE),
                    unselectedLabelColor:
                        const Color(0xff3DBEBE).withOpacity(0.3),
                    indicatorColor: Colors.white,
                    labelStyle: const TextStyle(
                        color: AppColors.primaryBlue,
                        fontFamily: 'Quicksand',
                        fontSize: 25),
                    tabs: const [
                      Tab(
                        child: Text('Jan'),
                      ),
                      Tab(
                        child: Text('Feb'),
                      ),
                      Tab(
                        child: Text('Mar'),
                      ),
                      Tab(
                        child: Text('Apr'),
                      ),
                      Tab(
                        child: Text('May'),
                      ),
                      Tab(
                        child: Text('Jun'),
                      ),
                      Tab(
                        child: Text('Jul'),
                      ),
                      Tab(
                        child: Text('Aug'),
                      ),
                      Tab(
                        child: Text('Sep'),
                      ),
                      Tab(
                        child: Text('Oct'),
                      ),
                      Tab(
                        child: Text('Nov'),
                      ),
                      Tab(
                        child: Text('Dec'),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: getTabBarViewChildren(),
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            expand: true,
            maxChildSize: 0.75,
            minChildSize: 0.47,
            initialChildSize: 0.47,
            builder: (BuildContext context, scrollController) {
              return Container(
                padding: const EdgeInsets.fromLTRB(25, 0, 10, 10),
                color: Colors.white,
                child: ListView(
                  controller: scrollController,
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Daily tasks',
                              style: TextStyle(
                                color: AppColors.primaryGrey,
                                fontFamily: 'Roboto',
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0002,
                              color: AppColors.primaryGrey,
                            ),
                            Text('10:00',
                                style: AppStyles.hourTimeLineStyle(context)),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0002,
                              color: AppColors.primaryGrey,
                            ),
                            Text('11:00',
                                style: AppStyles.hourTimeLineStyle(context)),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0002,
                              color: AppColors.primaryGrey,
                            ),
                            Text('12:00',
                                style: AppStyles.hourTimeLineStyle(context)),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0002,
                              color: AppColors.primaryGrey,
                            ),
                            Text('13:00',
                                style: AppStyles.hourTimeLineStyle(context)),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0002,
                              color: AppColors.primaryGrey,
                            ),
                            Text('14:00',
                                style: AppStyles.hourTimeLineStyle(context)),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0002,
                              color: AppColors.primaryGrey,
                            ),
                            Text('15:00',
                                style: AppStyles.hourTimeLineStyle(context)),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.122,
                                  width:
                                      MediaQuery.of(context).size.width * 0.74,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CalendarScreen3()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      decoration: const BoxDecoration(
                                        color: Color(0xff3DBEBE),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15)),
                                      ),
                                      child: Row(
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
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.122,
                                  width:
                                      MediaQuery.of(context).size.width * 0.74,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CalendarScreen3()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      decoration: const BoxDecoration(
                                        color: Color(0xff3DBEBE),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Meeting with John M.',
                                            style: AppStyles.timeLineNameStyle(
                                                context),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
