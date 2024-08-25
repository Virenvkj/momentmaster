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
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import './view_appointment.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({super.key});

  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  double _currentSliderValue =
      double.parse(DateFormat('H').format(DateTime.now()));
  bool openTimeSlider = false;
  bool openDoesNotRepeat = false;
  String notRepeat = 'Does not repeat';
  String reminder = 'None';
  bool openReminderOptions = false;
  bool calendarVisible = false;
  bool allDayEnabled = false;
  late CalendarController calendarController;
  TextEditingController titleController = TextEditingController();
  TextEditingController decriptionController = TextEditingController();
  String flexiOrNot = 'Allowed';
  DateFormat dateFormat = DateFormat("EEEE d MMM");
  DateTime currentDate = DateTime.now();
  DateFormat dateFormatHour = DateFormat('H');

  void onTappedDate(DateTime selectedDate, DateTime date) {
    setState(() {
      currentDate = selectedDate;
    });
  }

  void changeText2(String a) {
    setState(() {
      notRepeat = a;
      openDoesNotRepeat = false;
    });
  }

  void changeText(String a) {
    setState(() {
      reminder = a;
      openReminderOptions = false;
    });
  }

  @override
  void initState() {
    calendarController = CalendarController();
    dateFormat.format(currentDate);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: AppColors.primaryGrey,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              // textColor: AppColors.whiteColor,
              // color: AppColors.primaryBlue,
              child: const Text('Save'),
              onPressed: () {
                NavigationService2.navigate(
                  context,
                  'push',
                  ViewAppointment(
                    title: titleController.text,
                    selectedDate: currentDate.toString(),
                    reminder: reminder,
                    repeat: notRepeat,
                    flexiOrNot: flexiOrNot,
                    allDayTrue: allDayEnabled,
                    hourSelected: _currentSliderValue.toInt(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppConstants.sizer(0.08, 0, context),
            TextField(
              maxLength: 35,
              style: AppStyles.settingsMenuHeading(context),
              keyboardType: TextInputType.text,
              controller: titleController,
              decoration: InputDecoration(
                counter: const Offstage(),
                border: InputBorder.none,
                hintText: AppStrings.addTitle,
                hintStyle: AppStyles.settingsMenuHeading(context),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const AddDescriptionIcon(),
                      AppStrings.addDescription,
                      () {},
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    Row(
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
                    AppConstants.sizer(0.03, 0, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsMenuList.getSettingsAppOptions2(
                          context,
                          dateFormat.format(currentDate),
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
                                  '${_currentSliderValue.round().toString()}:00',
                                  style: AppStyles.quickSandText17(context),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    AppConstants.sizer(0.03, 0, context),
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
                              value: _currentSliderValue,
                              label:
                                  '${_currentSliderValue.round().toString()}:00',
                              onChanged: (double value) {
                                setState(
                                  () {
                                    _currentSliderValue = value;
                                  },
                                );
                              },
                            ),
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsMenuList.getSettingsAppOptions2(
                          context,
                          dateFormat.format(currentDate),
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
                                  '${_currentSliderValue.round().toString()}:00',
                                  style: AppStyles.quickSandText17(context),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const ReminderIcon(),
                      reminder,
                      () {
                        setState(() {
                          openReminderOptions = !openReminderOptions;
                        });
                      },
                    ),
                    AppConstants.sizer(0.03, 0, context),
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
                                      style: AppStyles.quickSandText17(context),
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
                                      style: AppStyles.quickSandText17(context),
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
                                      style: AppStyles.quickSandText17(context),
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
                                      style: AppStyles.quickSandText17(context),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  AppConstants.sizer(0.03, 0, context),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const NotRepeatIcon(),
                      notRepeat,
                      () {
                        setState(
                          () {
                            openDoesNotRepeat = !openDoesNotRepeat;
                          },
                        );
                      },
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    openDoesNotRepeat
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
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const AllowedIcon(),
                      flexiOrNot,
                      () {
                        FocusScope.of(context).unfocus();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
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
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.755,
                                        color: AppColors.lightGreyColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
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
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const Icon(
                        Icons.location_on,
                        color: AppColors.whiteColor,
                      ),
                      AppStrings.addLocation,
                      () {},
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const PinkIcon(),
                      AppStrings.pink,
                      () {},
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
