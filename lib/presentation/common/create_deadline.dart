import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/calendarScreens/common/deadline_common_wids.dart';
import 'package:momentmaster/presentation/calendarScreens/common/Icons/homeworkIcon.dart';
import 'package:momentmaster/presentation/calendarScreens/common/Icons/presentation.dart';
import 'package:momentmaster/presentation/calendarScreens/common/Icons/projectDelivery.dart';
import 'package:momentmaster/presentation/calendarScreens/common/Icons/testIcon.dart';
import 'package:momentmaster/presentation/calendarScreens/common/linear_progress_bar.dart';
import 'package:momentmaster/presentation/deadline/choose_deadline_date.dart';

class CreateDeadline extends StatefulWidget {
  const CreateDeadline({super.key});

  @override
  _CreateDeadlineState createState() => _CreateDeadlineState();
}

class _CreateDeadlineState extends State<CreateDeadline> {
  Color selectedColor1 = AppColors.whiteColor;
  Color selectedColor2 = AppColors.whiteColor;
  Color selectedColor3 = AppColors.whiteColor;
  Color selectedColor4 = AppColors.whiteColor;
  Color textColor1 = AppColors.primaryText;
  Color textColor2 = AppColors.primaryText;
  Color textColor3 = AppColors.primaryText;
  Color textColor4 = AppColors.primaryText;
  String iconColor1 = '3dbebe';
  String iconColor2 = '3dbebe';
  String iconColor3 = '3dbebe';
  String iconColor4 = '3dbebe';

  void changeScreen() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            AppConstants.sizer(0.05, 0, context),
            const LinearProgressBar(
              value: 0.0,
            ),
            AppConstants.sizer(0.025, 0, context),
            Text(
              AppStrings.whatsYourDeadlineFor,
              style: AppStyles.quickSandText22Black(context),
              textAlign: TextAlign.center,
            ),
            AppConstants.sizer(0.08, 0, context),
            DeadLineCommonWids.getDeadlineOptions(
              context,
              TestIcon(
                color: iconColor1,
              ),
              AppStrings.test,
              selectedColor1,
              textColor1,
              () {
                setState(
                  () {
                    iconColor1 = 'FFFFFF';
                    selectedColor1 = AppColors.primaryBlue;
                    textColor1 = AppColors.whiteColor;

                    Future.delayed(
                      const Duration(milliseconds: 100),
                      () {
                        NavigationService2.navigate(
                          context,
                          'pushRep',
                          const ChooseDeadlineDate(),
                        );
                      },
                    );
                  },
                );
              },
            ),
            AppConstants.sizer(0.05, 0, context),
            DeadLineCommonWids.getDeadlineOptions(
              context,
              HomeWorkIcon(
                color: iconColor2,
              ),
              AppStrings.homework,
              selectedColor2,
              textColor2,
              () {
                setState(() {
                  iconColor2 = 'FFFFFF';
                  selectedColor2 = AppColors.primaryBlue;
                  textColor2 = AppColors.whiteColor;
                  Future.delayed(
                    const Duration(milliseconds: 100),
                    () {
                      NavigationService2.navigate(
                        context,
                        'pushRep',
                        const ChooseDeadlineDate(),
                      );
                    },
                  );
                });
              },
            ),
            AppConstants.sizer(0.05, 0, context),
            DeadLineCommonWids.getDeadlineOptions(
              context,
              ProjectDeliveryIcon(
                color: iconColor3,
              ),
              AppStrings.projectDelivery,
              selectedColor3,
              textColor3,
              () {
                setState(() {
                  iconColor3 = 'FFFFFF';
                  selectedColor3 = AppColors.primaryBlue;
                  textColor3 = AppColors.whiteColor;
                  Future.delayed(
                    const Duration(milliseconds: 100),
                    () {
                      NavigationService2.navigate(
                        context,
                        'pushRep',
                        const ChooseDeadlineDate(),
                      );
                    },
                  );
                });
              },
            ),
            AppConstants.sizer(0.05, 0, context),
            DeadLineCommonWids.getDeadlineOptions(
              context,
              PresentationIcon(
                color: iconColor4,
              ),
              AppStrings.presentation,
              selectedColor4,
              textColor4,
              () {
                setState(() {
                  iconColor4 = 'FFFFFF';
                  selectedColor4 = AppColors.primaryBlue;
                  textColor4 = AppColors.whiteColor;
                  NavigationService2.navigate(
                    context,
                    'pushRep',
                    const ChooseDeadlineDate(),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
