import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/appointmentScreens/custom_switch.dart';
import 'package:momentmaster/presentation/appointmentScreens/general_colors.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/settingsScreens/color_settings.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  _GeneralSettingsState createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.23,
            color: AppColors.primaryBlue,
            padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
            child: Text(
              AppStrings.general,
              style: AppStyles.settingsMenuHeadingWhite(context),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.colors,
                      style: AppStyles.generalSettingsMenuOptions(context),
                    ),
                    InkWell(
                      onTap: () {
                        NavigationService2.navigate(
                            context, 'push', const ColorSettings());
                      },
                      child: const GeneralColorsIcon(),
                    ),
                  ],
                ),
                AppConstants.sizer(0.05, 0, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.notifications,
                      style: AppStyles.generalSettingsMenuOptions(context),
                    ),
                    CustomSwitch(
                      isActive: true,
                      activeColor: AppColors.primaryBlue,
                      value: status,
                      onChanged: (value) {
                        setState(
                          () {
                            status = value;
                          },
                        );
                      },
                    )
                  ],
                ),
                AppConstants.sizer(0.05, 0, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.standardAppointmentLength,
                      style: AppStyles.generalSettingsMenuOptions(context),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppStrings.hour1,
                        style: AppStyles.generalSettingsMenuOptions(context),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
