import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/subscription/heart_subscription_icon.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({super.key});

  @override
  _ChoosePlanScreenState createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 2,
      blurRadius: 2,
      offset: const Offset(0, 4),
    ),
  ];

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
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: ListView(
          shrinkWrap: true,
          children: [
            AppConstants.sizer(0.02, 0, context),
            const Center(
              child: HeartSubscriptionIcon(),
            ),
            AppConstants.sizer(0.02, 0, context),
            Text(
              AppStrings.creditOutMsg,
              style: AppStyles.blackColorBold_Size20(),
              textAlign: TextAlign.center,
            ),
            AppConstants.sizer(0.02, 0, context),
            Text(
              AppStrings.subscriptionText,
              style: AppStyles.greyColor_Size14(),
              textAlign: TextAlign.center,
            ),
            AppConstants.sizer(0.04, 0, context),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadow,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.yearly,
                          style: AppStyles.darkGreyColor_Size20(),
                          textAlign: TextAlign.left,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.save70,
                              style: AppStyles.blueColor_Size13(),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              AppStrings.chf30,
                              style: AppStyles.darkGreyColor_Size20(),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              AppStrings.chfTwoAndHalfperMonth,
                              style: AppStyles.greyColor_Size13(),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AppConstants.sizer(0.015, 0, context),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadow,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.monthly,
                          style: AppStyles.darkGreyColor_Size20(),
                          textAlign: TextAlign.left,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.save70,
                              style: AppStyles.blueColor_Size13(),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              AppStrings.chf6,
                              style: AppStyles.darkGreyColor_Size20(),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              AppStrings.chfSixperMonth,
                              style: AppStyles.greyColor_Size13(),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AppConstants.sizer(0.015, 0, context),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadow,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.lifeTime,
                          style: AppStyles.darkGreyColor_Size20(),
                          textAlign: TextAlign.left,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.chf150,
                              style: AppStyles.darkGreyColor_Size20(),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              AppStrings.payOnce,
                              style: AppStyles.greyColor_Size13(),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
