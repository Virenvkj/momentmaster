import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/core/utils/settings_menu_list.dart';
import 'package:momentmaster/presentation/appointmentScreens/all_day.dart';
import 'package:momentmaster/presentation/appointmentScreens/allowed.dart';
import 'package:momentmaster/presentation/appointmentScreens/custom_switch.dart';
import 'package:momentmaster/presentation/appointmentScreens/pink.dart';
import 'package:momentmaster/presentation/appointmentScreens/reminder.dart';
import 'package:momentmaster/presentation/appointmentScreens/repeat_or_not.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import './edit_appointment.dart';

class ViewAppointment extends StatefulWidget {
  final String? title;
  final String? description;
  final String selectedDate;
  final String? reminder;
  final String? repeat;
  final String? flexiOrNot;
  final bool allDayTrue;
  final int? hourSelected;
  const ViewAppointment(
      {super.key,
      this.title,
      this.description,
      required this.selectedDate,
      this.reminder,
      this.repeat,
      this.flexiOrNot,
      required this.allDayTrue,
      this.hourSelected});
  @override
  _ViewAppointmentState createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  late TextEditingController titleController;
  DateFormat dateFormat = DateFormat("EEEE d MMM");
  late String selectedDate;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    selectedDate = dateFormat.format(DateTime.parse(widget.selectedDate));
    titleController = TextEditingController(text: widget.title);
    super.initState();
  }

  void showDialog() {
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
                height: MediaQuery.of(context).size.height * 0.165,
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
                            height: MediaQuery.of(context).size.height * 0.04,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: CommonBottomAppBar(
        leftIcon: const Icon(Icons.arrow_back),
        rightIcon: const Icon(Icons.edit),
        onPressLeft: () {
          Navigator.of(context).pop();
        },
        onPressRight: () {
          NavigationService2.navigate(
            context,
            'push',
            EditAppointment(
              title: titleController.text,
              allDayEnabled: widget.allDayTrue,
              time: widget.hourSelected ?? 0,
              selectedDate: DateTime.parse(widget.selectedDate),
              reminder: widget.reminder ?? '',
              repeatText: widget.repeat ?? '',
              flexiText: widget.flexiOrNot ?? '',
            ),
          );
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
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
                    enabled: false,
                    controller: titleController,
                    decoration: InputDecoration(
                      counter: const Offstage(),
                      border: InputBorder.none,
                      hintStyle: AppStyles.settingsMenuHeading(context),
                    ),
                  ),
                ),
                IconButton(
                  color: AppColors.primaryGrey,
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    showDialog();
                  },
                ),
              ],
            ),
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsMenuList.getSettingsAppOptions(
                          context,
                          AppColors.primaryBlue,
                          const AllDayIcon(),
                          AppStrings.allDay,
                          null,
                        ),
                        CustomSwitch(
                          onChanged: (_) {},
                          isActive: false,
                          activeColor: AppColors.primaryBlue,
                          value: widget.allDayTrue,
                        ),
                      ],
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsMenuList.getSettingsAppOptions2(
                          context,
                          selectedDate,
                          null,
                        ),
                        !widget.allDayTrue
                            ? Text(
                                '${widget.hourSelected}:00',
                                style: AppStyles.quickSandText17(context),
                              )
                            : Container(),
                      ],
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsMenuList.getSettingsAppOptions2(
                          context,
                          selectedDate,
                          null,
                        ),
                        !widget.allDayTrue
                            ? Text(
                                '${widget.hourSelected}:00',
                                style: AppStyles.quickSandText17(context),
                              )
                            : Container(),
                      ],
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const ReminderIcon(),
                      widget.reminder ?? '',
                      null,
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const NotRepeatIcon(),
                      widget.repeat ?? '',
                      null,
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const AllowedIcon(),
                      widget.flexiOrNot ?? '',
                      null,
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const PinkIcon(),
                      AppStrings.pink,
                      null,
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
