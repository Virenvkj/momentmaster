import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/core/utils/settings_menu_list.dart';
import 'package:momentmaster/presentation/appointmentScreens/custom_switch.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/settingsScreens/i_cloud_settings.dart';

class CalendarSettings extends StatefulWidget {
  const CalendarSettings({super.key});

  @override
  _CalendarSettingsState createState() => _CalendarSettingsState();
}

class _CalendarSettingsState extends State<CalendarSettings> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.23,
              color: AppColors.primaryBlue,
              padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
              child: Text(
                AppStrings.calendars,
                style: AppStyles.settingsMenuHeadingWhite(context),
              ),
            ),
            AppConstants.sizer(0.05, 0, context),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SettingsMenuList.colorDot(AppColors.primaryBlue),
                      AppConstants.sizer(0, 0.04, context),
                      InkWell(
                        onTap: () {
                          NavigationService2.navigate(
                              context, 'push', const ICloudSettings());
                        },
                        child: Text(
                          AppStrings.iCloud,
                          style: AppStyles.generalSettingsMenuOptions(context),
                        ),
                      ),
                    ],
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
            ),
          ],
        ),
      ),
    );
  }
}
