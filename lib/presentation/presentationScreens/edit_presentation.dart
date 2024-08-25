import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/core/utils/settings_menu_list.dart';
import 'package:momentmaster/presentation/appointmentScreens/allowed.dart';
import 'package:momentmaster/presentation/appointmentScreens/customIcons/blue_tick.dart';
import 'package:momentmaster/presentation/appointmentScreens/hash.dart';
import 'package:momentmaster/presentation/appointmentScreens/pink.dart';
import 'package:momentmaster/presentation/appointmentScreens/reminder.dart';
import 'package:momentmaster/presentation/appointmentScreens/timer.dart';
import 'package:momentmaster/presentation/common/vertical_progress_bar.dart';
import 'package:momentmaster/presentation/presentationScreens/choose_deadLine_SchedulingRequest.dart';
import 'package:momentmaster/presentation/presentationScreens/choose_deadline_for.dart';
import 'package:momentmaster/presentation/presentationScreens/choose_deadline_startingScreen.dart';
import 'package:momentmaster/presentation/presentationScreens/choose_deadline_timeperiod.dart';
import 'package:momentmaster/presentation/presentationScreens/view_presentation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class EditPresentation1 extends StatefulWidget {
  final String? prepationTitle;
  final String? preparationDescription;
  final DateTime? selectedDate;
  final int? hourSelected;
  final String? reminder;
  final String? flexiOrNot;
  final String? location;

  const EditPresentation1(
      {super.key,
      this.prepationTitle,
      this.preparationDescription,
      this.selectedDate,
      this.hourSelected,
      this.reminder,
      this.flexiOrNot,
      this.location});
  @override
  _EditPresentation1State createState() => _EditPresentation1State();
}

class _EditPresentation1State extends State<EditPresentation1>
    with SingleTickerProviderStateMixin {
  late TextEditingController preparationTitle;
  late TextEditingController preparationDescription;
  late DateTime? selectedDate;
  late int? hourSelected;
  late String? reminder;
  late String? flexiOrNot;
  late TextEditingController location;
  DateFormat dateFormat = DateFormat("EEEE d MMM");
  int indexVal = 3;
  List<String> tasks = ['Learn Page 3-4', 'Write Story', 'Solve Worksheet'];
  late SlidableController slidableController;

  CalendarController calendarController = CalendarController();
  bool openTimeSlider = false;
  bool calendarVisible = false;
  late double currentSliderValue;
  bool openReminderOptions = false;

  void initializeData() {
    preparationTitle = TextEditingController(text: widget.prepationTitle);
    preparationDescription =
        TextEditingController(text: widget.preparationDescription);
    selectedDate = widget.selectedDate;
    hourSelected = widget.hourSelected;
    reminder = widget.reminder;
    flexiOrNot = widget.flexiOrNot;
    location = TextEditingController(text: widget.location);
    currentSliderValue = double.parse(widget.hourSelected.toString());
  }

  @override
  void initState() {
    super.initState();
    initializeData();
    slidableController = SlidableController(this);
  }

  void showDialogs() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox.expand(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: const Center(
                              child: Text(
                                AppStrings.chooseAction,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Quicksand',
                                  fontSize: 13,
                                  color: Color(0xff8f8f8f),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          width: MediaQuery.of(context).size.width * 0.84,
                          height: MediaQuery.of(context).size.height * 0.0005,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: const Center(
                              child: DefaultTextStyle(
                                style:
                                    TextStyle(decoration: TextDecoration.none),
                                child: Text(
                                  AppStrings.postPone,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Quicksand',
                                    fontSize: 20,
                                    color: Color(0xff007aff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.0005,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: const Center(
                              child: DefaultTextStyle(
                                style:
                                    TextStyle(decoration: TextDecoration.none),
                                child: Text(
                                  AppStrings.showOnCalendar,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Quicksand',
                                    fontSize: 20,
                                    color: Color(0xff007aff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.0005,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: const Center(
                              child: Text(
                                AppStrings.delete,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Quicksand',
                                  fontSize: 20,
                                  color: Color(0xfff16d70),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: AppColors.primaryGrey,
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.0005,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: const Center(
                              child: Text(
                                AppStrings.deleteAllPreparation,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Quicksand',
                                  fontSize: 20,
                                  color: Color(0xfff16d70),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      AppStrings.cancel,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        color: Color(0xff007aff),
                        letterSpacing: -0.48,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  TextStyle dateStyle(FontWeight fontWeight) {
    return AppStyles.calendarDateStyle(context);
  }

  DaysOfWeekStyle dayStyle() {
    return DaysOfWeekStyle(
        weekdayStyle: AppStyles.calendarDayStyle(context),
        weekendStyle: AppStyles.calendarDayStyle(context));
  }

  void onTappedDate(
      DateTime currentSelectedDate, DateTime currentSelectedDate2) {
    setState(() {
      selectedDate = currentSelectedDate;
    });
  }

  void changeText(String a) {
    setState(() {
      reminder = a;
      openReminderOptions = false;
    });
  }

  Widget getTodoList(String text) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.width * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(width: 2, color: AppColors.primaryBlue),
                    ),
                  ),
                ],
              ),
              AppConstants.sizer(0, 0.04, context),
              Text(
                text,
                style: AppStyles.settingsMenuOptions(context),
              ),
            ],
          ),
          IconButton(
            color: AppColors.primaryGrey,
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                if (indexVal != 0) {
                  indexVal--;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget editSchedule() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Slidable(
              controller: slidableController,
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {},
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    label: 'More',
                    foregroundColor: AppColors.darkGrayLittleColor,
                    icon: Icons.more_horiz,
                    onPressed: (_) => showDialogs(),
                  ),
                  SlidableAction(
                    label: 'Delete',
                    foregroundColor: AppColors.redDefault,
                    icon: Icons.delete,
                    onPressed: (_) {},
                  ),
                ],
              ),
              //actionPane: SlidableDrawerActionPane(),
              //endActionPane: SlidableDrawerActionPane(),,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:
                      (index % 2 == 0) ? Colors.white : AppColors.primaryBlue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '# Preparation 1',
                            style: TextStyle(
                              color: (index % 2 == 0)
                                  ? AppColors.primaryBlue
                                  : AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          (index % 2 == 0)
                              ? const Icon(
                                  Icons.flag,
                                  color: AppColors.primaryBlue,
                                )
                              : const Icon(Icons.outlined_flag,
                                  color: AppColors.whiteColor)
                        ],
                      ),
                      Text(
                        'Fri 18.04.2020 | 17:00 - 19:00',
                        style: TextStyle(
                          color: (index % 2 == 0)
                              ? AppColors.primaryBlue
                              : AppColors.whiteColor,
                          fontFamily: 'Quicksand',
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AppConstants.sizer(0.01, 0, context),
          ],
        );
      },
    );
  }

  Widget getWeekBubble(Color color, String day) {
    return InkWell(
      onTap: () {
        setState(
          () {
            if (color == const Color(0xffeeeeee)) {
              color = const Color(0xff58cccc);
            } else if (color == const Color(0xff58cccc)) {
              color = const Color(0xffeeeeee);
            }
          },
        );
      },
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              color: color,
            ),
          ),
          AppConstants.sizer(0.01, 0, context),
          Text(
            day,
            style: AppStyles.blueColor_Size20(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: const BlueTickIcon(),
              onTap: () {
                NavigationService2.navigate(
                  context,
                  'pushRep',
                  ViewPresentation1(
                    preparationTitle: preparationTitle.text,
                    prepationDescription: preparationDescription.text,
                    selectedDate: selectedDate,
                    hourSelected: hourSelected,
                    reminder: reminder,
                    flexiOrNot: flexiOrNot,
                    location: location.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppConstants.sizer(0.08, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.72,
                  child: TextFormField(
                    maxLength: 35,
                    style: AppStyles.settingsMenuHeading(context),
                    keyboardType: TextInputType.text,
                    enabled: true,
                    controller: preparationTitle,
                    decoration: InputDecoration(
                      counter: const Offstage(),
                      border: InputBorder.none,
                      hintStyle: AppStyles.settingsMenuHeading(context),
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    color: AppColors.primaryGrey,
                    icon: const Icon(Icons.more_vert),
                    onPressed: showDialogs,
                  ),
                ),
              ],
            ),
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child:
                          SettingsMenuList.getSettingsAppOptionsWithTextField(
                        context,
                        AppColors.primaryBlue,
                        const HashIcon(),
                        preparationDescription,
                        null,
                      ),
                    ),
                    AppConstants.sizer(0.015, 0, context),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SettingsMenuList.getSettingsAppOptions(
                            context,
                            AppColors.primaryBlue,
                            const TimerIcon(),
                            dateFormat.format(selectedDate ?? DateTime.now()),
                            () {
                              setState(() {
                                if (openTimeSlider) {
                                  openTimeSlider = false;
                                  calendarVisible = !calendarVisible;
                                } else {
                                  calendarVisible = !calendarVisible;
                                }
                              });
                            },
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (calendarVisible) {
                                  calendarVisible = false;
                                  openTimeSlider = !openTimeSlider;
                                } else {
                                  openTimeSlider = !openTimeSlider;
                                }
                              });
                            },
                            child: Text(
                              '$hourSelected:00',
                              style: AppStyles.quickSandText17(context),
                            ),
                          )
                        ],
                      ),
                    ),
                    calendarVisible
                        ? Column(
                            children: [
                              TableCalendar(
                                onDaySelected: onTappedDate,
                                firstDay: DateTime.now(),
                                focusedDay: DateTime.now(),
                                lastDay: DateTime.now(),
                                //  calendarController: calendarController,
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                daysOfWeekStyle: dayStyle(),
                                headerVisible: false,
                                calendarStyle: const CalendarStyle(
                                    // todayColor: AppColors.primaryRed,
                                    // selectedColor: AppColors.primaryBlue,
                                    // weekdayStyle: dateStyle(FontWeight.normal),
                                    // weekendStyle: dateStyle(FontWeight.normal),
                                    ),
                              ),
                              AppConstants.sizer(0.01, 0, context)
                            ],
                          )
                        : Container(),
                    openTimeSlider
                        ? SliderTheme(
                            data: const SliderThemeData(
                              overlappingShapeStrokeColor:
                                  AppColors.primaryGrey,
                              activeTrackColor: AppColors.primaryGrey,
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Slider(
                              autofocus: true,
                              inactiveColor: AppColors.primaryGrey,
                              activeColor: AppColors.primaryBlue,
                              min: 1,
                              max: 24,
                              divisions: 24,
                              value: currentSliderValue,
                              label:
                                  '${currentSliderValue.round().toString()}:00',
                              onChanged: (double value) {
                                setState(
                                  () {
                                    currentSliderValue = value;
                                    hourSelected = currentSliderValue.toInt();
                                  },
                                );
                              },
                            ),
                          )
                        : Container(),
                    AppConstants.sizer(0.015, 0, context),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SettingsMenuList.getSettingsAppOptions2(
                            context,
                            dateFormat.format(selectedDate ?? DateTime.now()),
                            () {
                              setState(() {
                                if (openTimeSlider) {
                                  openTimeSlider = false;
                                  calendarVisible = !calendarVisible;
                                } else {
                                  calendarVisible = !calendarVisible;
                                }
                              });
                            },
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (calendarVisible) {
                                  calendarVisible = false;
                                  openTimeSlider = !openTimeSlider;
                                } else {
                                  openTimeSlider = !openTimeSlider;
                                }
                              });
                            },
                            child: Text(
                              '$hourSelected:00',
                              style: AppStyles.quickSandText17(context),
                            ),
                          )
                        ],
                      ),
                    ),
                    AppConstants.sizer(0.015, 0, context),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: SettingsMenuList.getSettingsAppOptions(
                        context,
                        AppColors.primaryBlue,
                        const ReminderIcon(),
                        reminder ?? '',
                        () {
                          setState(
                            () {
                              openReminderOptions = !openReminderOptions;
                            },
                          );
                        },
                      ),
                    ),
                    AppConstants.sizer(0.015, 0, context),
                    openReminderOptions
                        ? Row(
                          children: [
                            AppConstants.sizer(0, 0.14, context),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    changeText(AppStrings.time10MinBefore);
                                  },
                                  child: Text(
                                    AppStrings.time10MinBefore,
                                    style:
                                        AppStyles.quickSandText17(context),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                AppConstants.sizer(0.03, 0, context),
                                InkWell(
                                  onTap: () {
                                    changeText(AppStrings.time30minBefore);
                                  },
                                  child: Text(
                                    AppStrings.time30minBefore,
                                    style:
                                        AppStyles.quickSandText17(context),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                AppConstants.sizer(0.03, 0, context),
                                InkWell(
                                  onTap: () {
                                    changeText(AppStrings.time1hourBefore);
                                  },
                                  child: Text(
                                    AppStrings.time1hourBefore,
                                    style:
                                        AppStyles.quickSandText17(context),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                AppConstants.sizer(0.03, 0, context),
                                InkWell(
                                  onTap: () {
                                    changeText(AppStrings.time1WeekBefore);
                                  },
                                  child: Text(
                                    AppStrings.time1WeekBefore,
                                    style:
                                        AppStyles.quickSandText17(context),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                AppConstants.sizer(0.03, 0, context),
                              ],
                            ),
                          ],
                        )
                        : Container(),
                    // AppConstants.sizer(0.015, 0, context),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: SettingsMenuList.getSettingsAppOptions(
                        context,
                        AppColors.primaryBlue,
                        const AllowedIcon(),
                        flexiOrNot ?? '',
                        () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                backgroundColor: AppColors.whiteColor,
                                title: const Text(
                                  'Flexible Appointment',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 17,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                content: const Text(
                                  AppStrings.flexiMessage,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 14,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                actions: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.001,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.755,
                                          color: AppColors.lightGreyColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  flexiOrNot = 'Not Flexible';
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                AppStrings.notFlexi,
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontSize: 17,
                                                  color: Color(0xff707070),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                                color: AppColors.lightGreyColor,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.002,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  flexiOrNot = 'Flexible';
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                AppStrings.flexible,
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontSize: 17,
                                                  color: Color(0xff3dbebe),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    AppConstants.sizer(0.015, 0, context),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child:
                          SettingsMenuList.getSettingsAppOptionsWithTextField(
                        context,
                        AppColors.primaryBlue,
                        const Icon(
                          Icons.location_on,
                          color: AppColors.whiteColor,
                        ),
                        location,
                        null,
                      ),
                    ),
                    AppConstants.sizer(0.015, 0, context),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: SettingsMenuList.getSettingsAppOptions(
                        context,
                        AppColors.primaryBlue,
                        const PinkIcon(),
                        AppStrings.pink,
                        null,
                      ),
                    ),

                    //Following widgets hold the widgets for Todo List
                    AppConstants.sizer(0.05, 0, context),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: indexVal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          color: AppColors.greyLight,
                          child: getTodoList(tasks[index]),
                        );
                      },
                    ),

                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          AppConstants.sizer(0, 0.10, context),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.primaryGrey,
                          ),
                          AppConstants.sizer(0, 0.04, context),
                          Text(
                            AppStrings.showDoneTodo,
                            style: AppStyles.settingsMenuOptions(context),
                          ),
                        ],
                      ),
                    ),
                    //Following widgets holds the widgets for task lists
                    AppConstants.sizer(0.03, 0, context),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerticalProgressBar(
                            height: 380,
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: editSchedule(),
                          ),
                        ],
                      ),
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    //Following widgets holds the logic for deadline settings
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.deadLineSetting,
                          style: AppStyles.greyColorBold_Size17(),
                        ),
                        AppConstants.sizer(0.03, 0, context),
                        InkWell(
                          onTap: () {
                            NavigationService2.navigate(
                                context, 'push', const ChooseDeadlineFor());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: AppColors.greyLight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.deadLineGoal,
                                  style: AppStyles.greyColor_Size17(),
                                ),
                                Text(
                                  AppStrings.exam,
                                  style: AppStyles.greyColor_Size17(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppConstants.sizer(0.01, 0, context),
                        InkWell(
                          onTap: () {
                            NavigationService2.navigate(context, 'push',
                                const ChooseDeadlineTimePeriod());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: AppColors.greyLight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.totalStudyTime,
                                  style: AppStyles.greyColor_Size17(),
                                ),
                                Text(
                                  AppStrings.hours6point5,
                                  style: AppStyles.greyColor_Size17(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppConstants.sizer(0.01, 0, context),
                        InkWell(
                          onTap: () {
                            NavigationService2.navigate(context, 'push',
                                const PreChooseDeadlineStartingDate());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: AppColors.greyLight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.preparationStart,
                                  style: AppStyles.greyColor_Size17(),
                                ),
                                Text(
                                  AppStrings.fridayDate,
                                  style: AppStyles.greyColor_Size17(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppConstants.sizer(0.01, 0, context),
                        InkWell(
                          onTap: () {
                            NavigationService2.navigate(context, 'push',
                                const PresSchedulingRequests());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: AppColors.greyLight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.maximalHourPerDay,
                                  style: AppStyles.greyColor_Size17(),
                                ),
                                Text(
                                  '2',
                                  style: AppStyles.greyColor_Size17(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppConstants.sizer(0.01, 0, context),
                        InkWell(
                          onTap: () {
                            NavigationService2.navigate(context, 'push',
                                const PresSchedulingRequests());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: AppColors.greyLight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.appointmentLength,
                                  style: AppStyles.greyColor_Size17(),
                                ),
                                Text(
                                  '1',
                                  style: AppStyles.greyColor_Size17(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppConstants.sizer(0.01, 0, context),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          color: AppColors.greyLight,
                          child: Text(
                            AppStrings.weekDays,
                            style: AppStyles.greyColor_Size17(),
                          ),
                        ),
                        AppConstants.sizer(0.01, 0, context),
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: AppColors.greyLight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              getWeekBubble(
                                  AppColors.greyMedium, AppStrings.mo),
                              getWeekBubble(
                                  AppColors.primaryBlue, AppStrings.di),
                              getWeekBubble(
                                  AppColors.primaryBlue, AppStrings.mi),
                              getWeekBubble(
                                  AppColors.greyMedium, AppStrings.dO),
                              getWeekBubble(
                                  AppColors.greyMedium, AppStrings.fr),
                              getWeekBubble(
                                  AppColors.greyMedium, AppStrings.sa),
                              getWeekBubble(
                                  AppColors.primaryBlue, AppStrings.sO)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
