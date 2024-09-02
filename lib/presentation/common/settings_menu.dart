import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/utils/settings_menu_list.dart';
import 'package:momentmaster/presentation/appointmentScreens/calendars.dart';
import 'package:momentmaster/presentation/appointmentScreens/parameters.dart';
import 'package:momentmaster/presentation/appointmentScreens/settings.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/settingsScreens/calendar_settings.dart';
import 'package:momentmaster/presentation/settingsScreens/general_settings.dart';
import 'package:momentmaster/presentation/settingsScreens/parameters_settings.dart';

import '../../core/service/navigation_service2.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({super.key});

  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
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
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.sizer(0.08, 0, context),
              Text(
                AppStrings.settings,
                style: AppStyles.settingsMenuHeading(context),
              ),
              AppConstants.sizer(0.06, 0, context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingsMenuList.getSettingsAppOptions(
                    context,
                    AppColors.settingsBlue,
                    const SettingsIcon(),
                    AppStrings.general,
                    () {
                      NavigationService2.navigate(
                          context, 'push', const GeneralSettings());
                    },
                  ),
                  AppConstants.sizer(0.04, 0, context),
                  SettingsMenuList.getSettingsAppOptions(
                    context,
                    AppColors.settingsOrange,
                    const ParameterIcon(),
                    AppStrings.parameters,
                    () {
                      NavigationService2.navigate(
                          context, 'push', const ParameterSettings());
                    },
                  ),
                  AppConstants.sizer(0.04, 0, context),
                  SettingsMenuList.getSettingsAppOptions(
                    context,
                    AppColors.settingsYellow,
                    const CalendarIcon(),
                    AppStrings.calendars,
                    () {
                      NavigationService2.navigate(
                          context, 'push', const CalendarSettings());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
