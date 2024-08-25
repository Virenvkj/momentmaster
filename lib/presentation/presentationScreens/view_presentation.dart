import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/core/utils/settings_menu_list.dart';
import 'package:momentmaster/presentation/appointmentScreens/allowed.dart';
import 'package:momentmaster/presentation/appointmentScreens/hash.dart';
import 'package:momentmaster/presentation/appointmentScreens/pink.dart';
import 'package:momentmaster/presentation/appointmentScreens/timer.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/common/vertical_progress_bar.dart';
import 'package:momentmaster/presentation/presentationScreens/choose_deadLine_SchedulingRequest.dart';
import 'package:momentmaster/presentation/presentationScreens/edit_presentation.dart';

import '../appointmentScreens/reminder.dart';

class ViewPresentation1 extends StatefulWidget {
  final String? preparationTitle;
  final String? prepationDescription;
  final DateTime? selectedDate;
  final int? hourSelected;
  final String? reminder;
  final String? flexiOrNot;
  final String? location;
  const ViewPresentation1({
    super.key,
    this.preparationTitle,
    this.prepationDescription,
    this.selectedDate,
    this.hourSelected,
    this.reminder,
    this.flexiOrNot,
    this.location,
  });

  @override
  _ViewPresentation1State createState() => _ViewPresentation1State();
}

class _ViewPresentation1State extends State<ViewPresentation1> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController titleController;
  DateFormat dateFormat = DateFormat("EEEE d MMM");
  late bool allDayTrue;
  late int hourSelected;
  late String reminder;
  late String flexiOrNot;
  late String repeat;
  late DateTime selectedDate;
  late String location;
  late String preparationDescription;
  late bool listAllPrep;

  void initializeData() {
    titleController =
        TextEditingController(text: widget.preparationTitle ?? 'English Test');
    preparationDescription = widget.prepationDescription ?? 'Preparation';
    location = widget.location ?? 'Add Location';
    hourSelected = widget.hourSelected ?? DateTime.now().hour;
    reminder = widget.reminder ?? '30 min before';
    flexiOrNot = widget.flexiOrNot ?? 'Allowed';
    selectedDate = widget.selectedDate ?? DateTime.now();
    listAllPrep = false;
  }

  @override
  void initState() {
    initializeData();
    super.initState();
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

  Widget getTodoList(String text) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
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
        ),
        AppConstants.sizer(0.02, 0, context),
      ],
    );
  }

  Widget editSchedule() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listAllPrep ? 5 : 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: (index % 2 == 0) ? Colors.white : AppColors.primaryBlue,
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
            AppConstants.sizer(0.01, 0, context),
            !listAllPrep
                ? InkWell(
                    onTap: () {
                      setState(() {
                        listAllPrep = !listAllPrep;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.circle,
                          color: (index % 2 == 0)
                              ? AppColors.greyMedium
                              : AppColors.primaryBlue,
                          size: 8,
                        ),
                        AppConstants.sizer(0.005, 0, context),
                        Icon(
                          Icons.circle,
                          color: (index % 2 == 0)
                              ? AppColors.greyMedium
                              : AppColors.primaryBlue,
                          size: 8,
                        ),
                        AppConstants.sizer(0.005, 0, context),
                        Icon(
                          Icons.circle,
                          color: (index % 2 == 0)
                              ? AppColors.greyMedium
                              : AppColors.primaryBlue,
                          size: 8,
                        ),
                      ],
                    ),
                  )
                : Container(),
            AppConstants.sizer(0.01, 0, context),
          ],
        );
      },
    );
  }

  Widget getWeekBubble(Color color, String day) {
    return Column(
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
              'pushRep',
              EditPresentation1(
                prepationTitle: titleController.text,
                preparationDescription: preparationDescription,
                selectedDate: selectedDate,
                hourSelected: hourSelected,
                reminder: reminder,
                flexiOrNot: flexiOrNot,
                location: location,
              ));
        },
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
                  onPressed: showDialogs,
                ),
              ],
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
                      const HashIcon(),
                      preparationDescription,
                      null,
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsMenuList.getSettingsAppOptions(
                          context,
                          AppColors.primaryBlue,
                          const TimerIcon(),
                          dateFormat.format(selectedDate),
                          null,
                        ),
                        Text(
                          '$hourSelected:00',
                          style: AppStyles.quickSandText17(context),
                        )
                      ],
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsMenuList.getSettingsAppOptions2(
                          context,
                          dateFormat.format(selectedDate),
                          null,
                        ),
                        Text(
                          '$hourSelected:00',
                          style: AppStyles.quickSandText17(context),
                        )
                      ],
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const ReminderIcon(),
                      reminder,
                      null,
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const AllowedIcon(),
                      flexiOrNot,
                      null,
                    ),
                    AppConstants.sizer(0.03, 0, context),
                    SettingsMenuList.getSettingsAppOptions(
                      context,
                      AppColors.primaryBlue,
                      const Icon(
                        Icons.location_on,
                        color: AppColors.whiteColor,
                      ),
                      location,
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
                    AppConstants.sizer(0.05, 0, context),
                    getTodoList('Learn Page 3-4'),
                    getTodoList('Write a story'),
                    getTodoList('Solve Worksheet'),
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
                    AppConstants.sizer(0.03, 0, context),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerticalProgressBar(
                            height: listAllPrep ? 380 : 200,
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: editSchedule(),
                          ),
                        ],
                      ),
                    ),

                    //Following column contains widgets for Deadline Settings
                    listAllPrep
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.deadLineSetting,
                                style: AppStyles.greyColorBold_Size17(),
                              ),
                              AppConstants.sizer(0.03, 0, context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              AppConstants.sizer(0.03, 0, context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              AppConstants.sizer(0.03, 0, context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              AppConstants.sizer(0.03, 0, context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              AppConstants.sizer(0.03, 0, context),
                              InkWell(
                                onTap: () {
                                  NavigationService2.navigate(context, 'push',
                                      const PresSchedulingRequests());
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              AppConstants.sizer(0.03, 0, context),
                              Text(
                                AppStrings.weekDays,
                                style: AppStyles.greyColor_Size17(),
                              ),
                              AppConstants.sizer(0.03, 0, context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            ],
                          )
                        : Container(),
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
