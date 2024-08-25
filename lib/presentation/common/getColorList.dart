import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/utils/settings_menu_list.dart';

class GetColorList {
  static Widget getColorTile(BuildContext context, Color color, String text) {
    return Column(
      children: [
        Row(
          children: [
            SettingsMenuList.colorDot(color),
            AppConstants.sizer(0, 0.05, context),
            Text(
              text,
              style: AppStyles.generalSettingsMenuOptions(context),
            ),
          ],
        ),
        AppConstants.sizer(0.05, 0, context)
      ],
    );
  }

  static Widget getColorTile2(BuildContext context, Color color, String text) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.07,
          color: AppColors.greyLight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppConstants.sizer(0, 0.03, context),
              SettingsMenuList.colorDot(color),
              AppConstants.sizer(0, 0.05, context),
              Text(
                text,
                style: AppStyles.generalSettingsMenuOptions(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        AppConstants.sizer(0.02, 0, context),
      ],
    );
  }
}
