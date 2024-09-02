import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/calendarScreens/common/linear_progress_bar.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/deadline/choose_deadline_startingDate.dart';

class SchedulingRequests extends StatefulWidget {
  const SchedulingRequests({super.key});

  @override
  _SchedulingRequestsState createState() => _SchedulingRequestsState();
}

class _SchedulingRequestsState extends State<SchedulingRequests> {
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
      bottomNavigationBar: CommonBottomAppBar(
        leftIcon: const Icon(Icons.arrow_back),
        rightIcon: const Icon(Icons.arrow_forward),
        onPressLeft: () {
          Navigator.of(context).pop();
        },
        onPressRight: () {
          NavigationService2.navigate(
            context,
            'pushRep',
            const ChooseDeadlineStartingDate(),
          );
        },
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
                  style: AppStyles.blueColor_Size20(),
                  textAlign: TextAlign.left,
                ),
                Text(
                  AppStrings.three,
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
                  AppStrings.breaksBetweenAppointments,
                  style: AppStyles.blueColor_Size20(),
                  textAlign: TextAlign.left,
                ),
                Text(
                  AppStrings.fifteen,
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
                  AppStrings.noOfAppointmentsPerWeek,
                  style: AppStyles.blueColor_Size20(),
                  textAlign: TextAlign.left,
                ),
                Text(
                  AppStrings.five,
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
                  AppStrings.maxAppointmentsPerWeek,
                  style: AppStyles.blueColor_Size20(),
                  textAlign: TextAlign.left,
                ),
                Text(
                  AppStrings.three,
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
                  style: AppStyles.blueColor_Size20(),
                  textAlign: TextAlign.left,
                ),
                Text(
                  AppStrings.afternoon,
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
