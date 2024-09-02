import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/appointmentScreens/custom_switch.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';

class TestParameter extends StatefulWidget {
  const TestParameter({super.key});

  @override
  _TestParameterState createState() => _TestParameterState();
}

class _TestParameterState extends State<TestParameter> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonBottomAppBar(
        leftIcon: const Icon(Icons.arrow_back),
        rightIcon: const Icon(Icons.arrow_forward),
        onPressLeft: () {
          Navigator.of(context).pop();
        },
        rightIconColor: AppColors.whiteColor,
        onPressRight: () {},
      ),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.23,
            color: AppColors.primaryBlue,
            padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
            child: Text(
              AppStrings.test,
              style: AppStyles.settingsMenuHeadingWhite(context),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.optimialStudySession,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(AppStrings.time2hours,
                            style:
                                AppStyles.generalSettingsMenuOptions(context)),
                      ),
                    ],
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.shortestSession,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(AppStrings.time30min,
                            style:
                                AppStyles.generalSettingsMenuOptions(context)),
                      ),
                    ],
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.longestSession,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(AppStrings.time4hours,
                            style:
                                AppStyles.generalSettingsMenuOptions(context)),
                      ),
                    ],
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.appointmentsCanbeMoved,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                      CustomSwitch(
                        isActive: true,
                        activeColor: AppColors.primaryBlue,
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                      )
                    ],
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.alwaysHighPriority,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                      CustomSwitch(
                        isActive: true,
                        activeColor: AppColors.primaryBlue,
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                      )
                    ],
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.timeOfDay,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          AppStrings.afternoon,
                          style: AppStyles.generalSettingsMenuOptions(context),
                        ),
                      )
                    ],
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.preferredTimeOfDay,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                      Text(
                        AppStrings.time14_21,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                    ],
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.bestTimesOfDay,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          AppStrings.time17_19,
                          style: AppStyles.generalSettingsMenuOptions(context),
                        ),
                      )
                    ],
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
