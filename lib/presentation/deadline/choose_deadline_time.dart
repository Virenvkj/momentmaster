import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/appointmentScreens/custom_switch.dart';
import 'package:momentmaster/presentation/calendarScreens/common/linearProgressBar.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/deadline/deadline_details.dart';

class ChooseDeadlineTime extends StatefulWidget {
  const ChooseDeadlineTime({super.key});

  @override
  _ChooseDeadlineTimeState createState() => _ChooseDeadlineTimeState();
}

class _ChooseDeadlineTimeState extends State<ChooseDeadlineTime> {
  String startTime = DateTime.now().hour.toString();
  String endTime = '12';
  TextStyle basicText = AppStyles.greyColor_Size25();
  TextStyle boldText = AppStyles.greyColor_Size25Bold();
  double currentSliderValue = 12;
  bool allDayEnabled = false;
  bool startTimeActive = false;
  bool endTimeActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: CommonBottomAppBar(
        leftIcon: const Icon(Icons.arrow_back),
        rightIcon: const Icon(Icons.arrow_forward),
        onPressLeft: () {
          Navigator.of(context).pop();
        },
        onPressRight: () {
          NavigationService2.navigate(
            context,
            'pushRep',
            const DeadlineDetailsScreen(),
          );
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: ListView(
          shrinkWrap: true,
          children: [
            AppConstants.sizer(0.05, 0, context),
            const LinearProgressBar(
              value: 0.2,
            ),
            AppConstants.sizer(0.025, 0, context),
            Text(
              AppStrings.selectTime,
              style: AppStyles.quickSandText22Black(context),
              textAlign: TextAlign.center,
            ),
            AppConstants.sizer(0.025, 0, context),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      AppConstants.sizer(0.01, 0, context),
                      Text(
                        AppStrings.start,
                        style: AppStyles.greyColor_Size18(context),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  AppConstants.sizer(0, 0.05, context),
                  InkWell(
                    onTap: () {
                      setState(() {
                        startTimeActive = true;
                        endTimeActive = false;
                      });
                    },
                    child: Text(
                      '$startTime:00',
                      style: startTimeActive ? boldText : basicText,
                    ),
                  ),
                  AppConstants.sizer(0, 0.15, context),
                  Column(
                    children: [
                      AppConstants.sizer(0.01, 0, context),
                      Text(
                        AppStrings.end,
                        style: AppStyles.greyColor_Size18(context),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  AppConstants.sizer(0, 0.05, context),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          endTimeActive = true;
                          startTimeActive = false;
                        },
                      );
                    },
                    child: Text(
                      '$endTime:00',
                      style: endTimeActive ? boldText : basicText,
                    ),
                  ),
                ],
              ),
            ),
            AppConstants.sizer(0.25, 0, context),
            SliderTheme(
              data: const SliderThemeData(
                overlappingShapeStrokeColor: AppColors.primaryGrey,
                activeTrackColor: AppColors.primaryGrey,
                showValueIndicator: ShowValueIndicator.always,
              ),
              child: Slider(
                inactiveColor: AppColors.primaryGrey,
                activeColor: AppColors.primaryBlue,
                min: 1,
                max: 24,
                divisions: 24,
                value: startTimeActive
                    ? double.parse(startTime)
                    : double.parse(endTime),
                label: startTimeActive ? '$startTime:00' : '$endTime:00',
                onChanged: (double value) {
                  setState(
                    () {
                      if (startTimeActive) {
                        if (value > 10) {
                          startTime = value.toString().substring(0, 2);
                        } else if (value < 10) {
                          startTime = value.toString().substring(0, 1);
                        }
                      } else if (endTimeActive) {
                        if (value > 10) {
                          endTime = value.toString().substring(0, 2);
                        } else if (value < 10) {
                          endTime = value.toString().substring(0, 1);
                        }
                      }
                    },
                  );
                },
              ),
            ),
            AppConstants.sizer(0.23, 0, context),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.allDay,
                    style: AppStyles.greyColor_Size18(context),
                    textAlign: TextAlign.left,
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
            AppConstants.sizer(0.03, 0, context),
          ],
        ),
      ),
    );
  }
}
