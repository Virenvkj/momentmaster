import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';

class DeadLineCommonWids {
  static Widget getDeadlineOptions(BuildContext context, Widget icon,
      String text, Color iconColor, Color textColor, Function() onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: iconColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: AppColors.greyMedium,
              blurRadius: 20.0,
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: [
            icon,
            AppConstants.sizer(0, 0.06, context),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
