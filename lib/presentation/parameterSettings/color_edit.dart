import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/common/getColorList.dart';

class ColorEdit extends StatefulWidget {
  const ColorEdit({super.key});

  @override
  _ColorEditState createState() => _ColorEditState();
}

class _ColorEditState extends State<ColorEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonBottomAppBar(
        leftIcon: const Icon(Icons.arrow_back),
        rightIcon: const Icon(Icons.edit),
        leftIconColor: AppColors.whiteColor,
        onPressLeft: () {},
        onPressRight: () {
          Navigator.of(context).pop();
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
              AppStrings.renameColors,
              style: AppStyles.settingsMenuHeadingWhite(context),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetGreen, AppStrings.green),
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetRed, AppStrings.red),
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetPurple, AppStrings.purple),
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetViolet, AppStrings.violet),
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetOrange, AppStrings.orange),
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetBlue, AppStrings.blue),
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetBrown, AppStrings.brown),
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetGrey, AppStrings.grey),
                  GetColorList.getColorTile2(
                      context, AppColors.colorSetMagenta, AppStrings.magenta),
                  AppConstants.sizer(0.001, 0, context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
