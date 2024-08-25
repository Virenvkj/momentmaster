import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/appointmentScreens/customIcons/blue_tick.dart';
import 'package:momentmaster/presentation/calendarScreens/common/linearProgressBar.dart';

class PresSchedulingRequests extends StatefulWidget {
  const PresSchedulingRequests({super.key});

  @override
  _PresSchedulingRequestsState createState() => _PresSchedulingRequestsState();
}

class _PresSchedulingRequestsState extends State<PresSchedulingRequests> {
  Widget getWeekBubble(Color color, String day) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            color: color,
          ),
        ),
        AppConstants.sizer(0.01, 0, context),
        Text(
          day,
          style: AppStyles.blueColor_Size20(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: const BlueTickIcon(),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: ListView(
          children: [
            AppConstants.sizer(0.05, 0, context),
            const LinearProgressBar(
              value: 0.9,
            ),
            AppConstants.sizer(0.025, 0, context),
            Text(
              AppStrings.doYouHaveAnyMoreSchedulingRequests,
              style: AppStyles.quickSandText22Black(context),
              textAlign: TextAlign.center,
            ),
            AppConstants.sizer(0.025, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.maximalHoursPerDay,
                  style: AppStyles.blueColor_Size20(),
                  textAlign: TextAlign.left,
                ),
                Text(
                  AppStrings.two,
                  style: AppStyles.blueColorBold_Size25(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            AppConstants.sizer(0.03, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.severalAppointmentsOnTheSameDay,
                  style: AppStyles.greyColor_Size20(),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            AppConstants.sizer(0.03, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    AppStrings.breaksBetweenAppointmentsmin,
                    style: AppStyles.greyColor_Size20(),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            AppConstants.sizer(0.03, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.noOfAppointmentsPerWeek,
                  style: AppStyles.greyColor_Size20(),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            AppConstants.sizer(0.03, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.maxAppointmentsPerWeek,
                  style: AppStyles.greyColor_Size20(),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            AppConstants.sizer(0.03, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.appointmentLength,
                  style: AppStyles.blueColor_Size20(),
                  textAlign: TextAlign.left,
                ),
                Text(
                  AppStrings.two,
                  style: AppStyles.blueColorBold_Size25(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            AppConstants.sizer(0.03, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.timesOfDay,
                  style: AppStyles.greyColor_Size20(),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            AppConstants.sizer(0.03, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.selectWeekdays,
                  style: AppStyles.blueColor_Size20(),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            AppConstants.sizer(0.01, 0, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getWeekBubble(AppColors.greyMedium, AppStrings.mo),
                getWeekBubble(AppColors.primaryBlue, AppStrings.di),
                getWeekBubble(AppColors.primaryBlue, AppStrings.mi),
                getWeekBubble(AppColors.greyMedium, AppStrings.dO),
                getWeekBubble(AppColors.greyMedium, AppStrings.fr),
                getWeekBubble(AppColors.greyMedium, AppStrings.sa),
                getWeekBubble(AppColors.primaryBlue, AppStrings.sO)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
