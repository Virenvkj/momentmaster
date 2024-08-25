import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/appointmentScreens/customIcons/blue_tick.dart';

class ChooseDeadlineTimePeriod extends StatefulWidget {
  const ChooseDeadlineTimePeriod({super.key});

  @override
  _ChooseDeadlineTimePeriodState createState() =>
      _ChooseDeadlineTimePeriodState();
}

Duration initialtimer = const Duration();
List<Text> hourList = [];
List<Text> minuteList = [];
List<Text> getHour() {
  hourList.clear();
  for (int i = 1; i <= 12; i++) {
    hourList.add(
      Text(
        i.toString(),
        style: AppStyles.greyColor_Size40(),
      ),
    );
  }
  return hourList;
}

List<Text> getMinutes() {
  minuteList.clear();
  for (int i = 1; i <= 60; i++) {
    minuteList.add(
      Text(
        i.toString(),
        style: AppStyles.greyColor_Size40(),
      ),
    );
  }
  return minuteList;
}

class _ChooseDeadlineTimePeriodState extends State<ChooseDeadlineTimePeriod> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: ListView(
              shrinkWrap: true,
              children: [
                AppConstants.sizer(0.05, 0, context),
                Text(
                  AppStrings.howLongDoYouPlanToStudyForTheExam,
                  style: AppStyles.quickSandText22Black(context),
                  textAlign: TextAlign.center,
                ),
                AppConstants.sizer(0.27, 0, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          backgroundColor: AppColors.whiteColor,
                          onSelectedItemChanged: null,
                          children: getHour(),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.h,
                              style: AppStyles.greyColor_Size18(context),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          backgroundColor: AppColors.whiteColor,
                          onSelectedItemChanged: null,
                          children: getMinutes(),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.min,
                              style: AppStyles.greyColor_Size18(context),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                AppConstants.sizer(0.02, 0, context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
