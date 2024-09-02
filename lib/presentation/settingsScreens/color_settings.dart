import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/common/getColorList.dart';
import 'package:momentmaster/presentation/parameterSettings/color_edit.dart';

class ColorSettings extends StatefulWidget {
  const ColorSettings({super.key});

  @override
  _ColorSettingsState createState() => _ColorSettingsState();
}

class _ColorSettingsState extends State<ColorSettings> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonBottomAppBar(
        leftIcon: const Icon(Icons.arrow_back),
        rightIcon: const Icon(Icons.edit),
        onPressLeft: () {
          Navigator.of(context).pop();
        },
        onPressRight: () {
          NavigationService2.navigate(context, 'push', const ColorEdit());
        },
      ),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.23,
            color: AppColors.primaryBlue,
            padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
            child: Text(
              AppStrings.colors,
              style: AppStyles.settingsMenuHeadingWhite(context),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  GetColorList.getColorTile(
                      context, AppColors.colorSetGreen, AppStrings.green),
                  GetColorList.getColorTile(
                      context, AppColors.colorSetRed, AppStrings.red),
                  GetColorList.getColorTile(
                      context, AppColors.colorSetPurple, AppStrings.purple),
                  GetColorList.getColorTile(
                      context, AppColors.colorSetViolet, AppStrings.violet),
                  GetColorList.getColorTile(
                      context, AppColors.colorSetOrange, AppStrings.orange),
                  GetColorList.getColorTile(
                      context, AppColors.colorSetBlue, AppStrings.blue),
                  GetColorList.getColorTile(
                      context, AppColors.colorSetBrown, AppStrings.brown),
                  GetColorList.getColorTile(
                      context, AppColors.colorSetGrey, AppStrings.grey),
                  GetColorList.getColorTile(
                      context, AppColors.colorSetMagenta, AppStrings.magenta),
                  AppConstants.sizer(0.001, 0, context),
                ],
              ),
            ),
          ),
          AppConstants.sizer(0.02, 0, context)
        ],
      ),
    );
  }
}
