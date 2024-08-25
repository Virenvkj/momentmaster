import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/appointmentScreens/create_your_self.dart';
import 'package:momentmaster/presentation/calendarScreens/common/Icons/homeworkIcon.dart';
import 'package:momentmaster/presentation/calendarScreens/common/Icons/presentation.dart';
import 'package:momentmaster/presentation/calendarScreens/common/Icons/projectDelivery.dart';
import 'package:momentmaster/presentation/calendarScreens/common/Icons/testIcon.dart';
import 'package:momentmaster/presentation/parameterSettings/homework.dart';
import 'package:momentmaster/presentation/parameterSettings/presentation.dart';
import 'package:momentmaster/presentation/parameterSettings/projectDelivery.dart';

import '../../core/utils/settings_menu_list.dart';
import '../common/common_bottom_appbar.dart';
import '../parameterSettings/testParameter.dart';

class ParameterSettings extends StatefulWidget {
  const ParameterSettings({super.key});

  @override
  _ParameterSettingsState createState() => _ParameterSettingsState();
}

class _ParameterSettingsState extends State<ParameterSettings> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.23,
              color: AppColors.primaryBlue,
              padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
              child: Text(
                AppStrings.parameters,
                style: AppStyles.settingsMenuHeadingWhite(context),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingsMenuList.getParameterSettingsOption(
                    context,
                    const TestIcon(),
                    AppStrings.test,
                    () {
                      NavigationService2.navigate(
                          context, 'push', const TestParameter());
                    },
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  SettingsMenuList.getParameterSettingsOption(
                    context,
                    const HomeWorkIcon(),
                    AppStrings.homework,
                    () {
                      NavigationService2.navigate(
                          context, 'push', const HomeParameter());
                    },
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  SettingsMenuList.getParameterSettingsOption(
                    context,
                    const ProjectDeliveryIcon(),
                    AppStrings.projectDelivery,
                    () {
                      NavigationService2.navigate(
                          context, 'push', const ProjectDeliveryParameter());
                    },
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  SettingsMenuList.getParameterSettingsOption(
                    context,
                    const PresentationIcon(),
                    AppStrings.presentation,
                    () {
                      NavigationService2.navigate(
                          context, 'push', const PresentationParameter());
                    },
                  ),
                  AppConstants.sizer(0.05, 0, context),
                  SettingsMenuList.getParameterSettingsOption(
                    context,
                    const CreateYourselfIcon(),
                    AppStrings.createYourself,
                    () {},
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
