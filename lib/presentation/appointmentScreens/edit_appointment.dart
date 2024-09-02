import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/core/utils/settings_menu_list.dart';
import 'package:momentmaster/presentation/appointmentScreens/add_description.dart';
import 'package:momentmaster/presentation/appointmentScreens/all_day.dart';
import 'package:momentmaster/presentation/appointmentScreens/allowed.dart';
import 'package:momentmaster/presentation/appointmentScreens/custom_switch.dart';
import 'package:momentmaster/presentation/appointmentScreens/pink.dart';
import 'package:momentmaster/presentation/appointmentScreens/reminder.dart';
import 'package:momentmaster/presentation/appointmentScreens/repeat_or_not.dart';
import 'package:momentmaster/presentation/appointmentScreens/view_appointment.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'customIcons/blue_tick.dart';

class EditAppointment extends StatefulWidget {
  final String title;
  final bool allDayEnabled;
  final int time;
  final DateTime selectedDate;
  final String reminder;
  final String repeatText;
  final String flexiText;
  const EditAppointment({
    super.key,
    required this.title,
    required this.allDayEnabled,
    required this.time,
    required this.selectedDate,
    required this.reminder,
    required this.repeatText,
    required this.flexiText,
  });
  @override
  _EditAppointmentState createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  late TextEditingController titleController;
  late CalendarController calendarController;
  DateFormat dateFormat = DateFormat("EEEE, d MMM");
  DateFormat dateFormatHour = DateFormat('H');
  late int hourSelected;
  late bool openTimeSlider = false;
  late bool calendarVisible = false;
  late double currentSliderValue;
  late String currentDate;
  bool openReminderOptions = false;
  bool openRepeatOptions = false;
  late String reminderText;
  late String repeatText;
  late String flexiText;
  bool allDayEnabled = false;
  DateTime currentDate2 = DateTime.now();

  TextStyle dateStyle(FontWeight fontWeight) {
    return AppStyles.calendarDateStyle(context);
  }

  DaysOfWeekStyle dayStyle() {
    return DaysOfWeekStyle(
        weekdayStyle: AppStyles.calendarDayStyle(context),
        weekendStyle: AppStyles.calendarDayStyle(context));
  }

  void changeText2(String a) {
    setState(() {
      repeatText = a;
      openRepeatOptions = false;
    });
  }

  void changeText(String a) {
    setState(() {
      reminderText = a;
      openReminderOptions = false;
    });
  }

  @override
  void initState() {
    allDayEnabled = widget.allDayEnabled;
    flexiText = widget.flexiText;
    repeatText = widget.repeatText;
    reminderText = widget.reminder;
    currentDate2 = widget.selectedDate;
    currentDate = dateFormat.format(widget.selectedDate);
    calendarController = CalendarController();
    titleController = TextEditingController(text: widget.title);
    hourSelected = widget.time;
    currentSliderValue = double.parse(hourSelected.toString());
    super.initState();
  }

  // void onTappedDate(
  //     DateTime selectedDate, List<dynamic> list1, List<dynamic> list2) {
  //   setState(() {
  //     currentDate = dateFormat.format(selectedDate);
  //     currentDate2 = selectedDate;
  //   });
  // }

  void onTappedDate(DateTime selectedDate, DateTime date) {
    setState(() {
      currentDate = dateFormat.format(selectedDate);
      currentDate2 = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppConstants.sizer(0.08, 0, context),
            Container(
              color: AppColors.greyLight,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                maxLength: 35,
                style: AppStyles.settingsMenuHeading(context),
                keyboardType: TextInputType.text,
                controller: titleController,
                decoration: const InputDecoration(
                  counter: Offstage(),
                  border: InputBorder.none,
                ),
              ),
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
                      child: SettingsMenuList.getSettingsAppOptions(
                        context,
                        AppColors.primaryBlue,
                        const AddDescriptionIcon(),
                        AppStrings.addDescription,
                        () {},
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
                            const AllDayIcon(),
                            AppStrings.allDay,
                            () {},
                          ),
                          CustomSwitch(
                            isActive: true,
                            activeColor: AppColors.primaryBlue,
                            value: allDayEnabled,
                            onChanged: (value) {
                              setState(
                                () {
                                  allDayEnabled = value;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    AppConstants.sizer(0.015, 0, context),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SettingsMenuList.getSettingsAppOptions2(
                            context,
                            currentDate,
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
                          !allDayEnabled
                              ? InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        if (calendarVisible) {
                                          calendarVisible = false;
                                          openTimeSlider = !openTimeSlider;
                                        } else {
                                          openTimeSlider = !openTimeSlider;
                                        }
                                      },
                                    );
                                  },
                                  child: Text(
                                    '$hourSelected:00',
                                    style: AppStyles.quickSandText17(context),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    AppConstants.sizer(0.015, 0, context),
                    calendarVisible
                        ? Column(
                            children: [
                              TableCalendar(
                                focusedDay: DateTime.now(),
                                firstDay: DateTime.now(),
                                lastDay: DateTime.now(),
                                onDaySelected: onTappedDate,
                                // calendarController: calendarController,
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
                              min: 0,
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SettingsMenuList.getSettingsAppOptions2(
                            context,
                            currentDate,
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
                          !allDayEnabled
                              ? InkWell(
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
                              : Container(),
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
                        reminderText,
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: SettingsMenuList.getSettingsAppOptions(
                        context,
                        AppColors.primaryBlue,
                        const NotRepeatIcon(),
                        repeatText,
                        () {
                          setState(
                            () {
                              openRepeatOptions = !openRepeatOptions;
                            },
                          );
                        },
                      ),
                    ),
                    AppConstants.sizer(0.015, 0, context),
                    openRepeatOptions
                        ? Row(
                          children: [
                            AppConstants.sizer(0, 0.14, context),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    changeText2(AppStrings.everyDay);
                                  },
                                  child: Text(
                                    AppStrings.everyDay,
                                    style:
                                        AppStyles.quickSandText17(context),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                AppConstants.sizer(0.03, 0, context),
                                InkWell(
                                  onTap: () {
                                    changeText2(AppStrings.everyWeek);
                                  },
                                  child: Text(
                                    AppStrings.everyWeek,
                                    style:
                                        AppStyles.quickSandText17(context),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                AppConstants.sizer(0.03, 0, context),
                                InkWell(
                                  onTap: () {
                                    changeText2(AppStrings.everyMonth);
                                  },
                                  child: Text(
                                    AppStrings.everyMonth,
                                    style:
                                        AppStyles.quickSandText17(context),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                AppConstants.sizer(0.03, 0, context),
                                InkWell(
                                  onTap: () {
                                    changeText2(AppStrings.everyYear);
                                  },
                                  child: Text(
                                    AppStrings.everyYear,
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.greyLight,
                      child: SettingsMenuList.getSettingsAppOptions(
                        context,
                        AppColors.primaryBlue,
                        const AllowedIcon(),
                        flexiText,
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
                                                  flexiText = 'Not Flexible';
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
                                                  flexiText = 'Flexible';
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
                      child: SettingsMenuList.getSettingsAppOptions(
                        context,
                        AppColors.primaryBlue,
                        const Icon(
                          Icons.location_on,
                          color: AppColors.whiteColor,
                        ),
                        AppStrings.addLocation,
                        () {},
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
                        () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      NavigationService2.navigate(
                          context,
                          'pushRep',
                          ViewAppointment(
                            title: titleController.text,
                            selectedDate: currentDate2.toString(),
                            reminder: reminderText,
                            repeat: repeatText,
                            flexiOrNot: flexiText,
                            allDayTrue: allDayEnabled,
                            hourSelected: hourSelected,
                          ));
                    },
                    child: const BlueTickIcon(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
