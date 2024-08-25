import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_styles.dart';

class SettingsMenuList {
  static Widget colorDot(Color color) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
        color: color,
      ),
    );
  }

  static Widget getSettingsAppOptions2(
    BuildContext context,
    String text,
    Function()? onClick,
  ) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          AppConstants.sizer(0, 0.14, context),
          Text(
            text,
            style: AppStyles.settingsMenuOptions(context),
          ),
        ],
      ),
    );
  }

  static Widget getSettingsAppOptions(
    BuildContext context,
    Color color,
    Widget icon,
    String text,
    Function()? onClick,
  ) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: color,
                ),
              ),
              icon,
            ],
          ),
          AppConstants.sizer(0, 0.04, context),
          Text(
            text,
            style: AppStyles.settingsMenuOptions(context),
          ),
        ],
      ),
    );
  }

  static Widget getSettingsAppOptionsWithTextField(
    BuildContext context,
    Color color,
    Widget icon,
    TextEditingController textController,
    Function()? onClick,
  ) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: color,
                ),
              ),
              icon,
            ],
          ),
          AppConstants.sizer(0, 0.04, context),
          Flexible(
            child: TextFormField(
              keyboardType: TextInputType.text,
              maxLength: 35,
              decoration: const InputDecoration(
                counter: Offstage(),
                border: InputBorder.none,
                hintText: '',
              ),
              controller: textController,
              style: AppStyles.settingsMenuOptions(context),
            ),
          ),
        ],
      ),
    );
  }

  static Widget getParameterSettingsOption(
      BuildContext context, Widget icon, String text, Function()? onClick) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          icon,
          AppConstants.sizer(0, 0.04, context),
          Text(
            text,
            style: AppStyles.settingsMenuOptions(context),
          ),
        ],
      ),
    );
  }
}
