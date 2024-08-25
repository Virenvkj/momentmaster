import 'dart:async';

import 'package:flutter/material.dart';
import 'package:momentmaster/application/onboarding/onboarding_message_view_model.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/base_view.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_text2.dart';

class OnboardingText1 extends StatefulWidget {
  const OnboardingText1({super.key});

  @override
  State<OnboardingText1> createState() => _OnboardingText1State();
}

class _OnboardingText1State extends State<OnboardingText1> {
  final List<String> onBoardingMsg = [
    AppStrings.are,
    AppStrings.you,
    AppStrings.ready,
    AppStrings.forString,
    AppStrings.the,
    AppStrings.most,
    AppStrings.powerful,
    AppStrings.calendar,
    AppStrings.questionMark,
    AppStrings.comma,
    AppStrings.great,
    AppStrings.to,
    AppStrings.create,
    AppStrings.your,
    AppStrings.personal,
    AppStrings.calendar,
    AppStrings.we,
    AppStrings.need,
    AppStrings.some,
    AppStrings.information,
    AppStrings.about,
    AppStrings.youDot,
  ];
  late Timer timer;
  int start = 0;
  String displayMsg = AppStrings.hello;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        getOnBoardingMsg();
      },
    );
  }

  void getOnBoardingMsg() {
    int start = 0;
    const twoSec = Duration(milliseconds: 500);
    timer = Timer.periodic(
      twoSec,
      (Timer timer) {
        if (start < onBoardingMsg.length) {
          displayMsg = onBoardingMsg[start];
          start++;
        } else {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const OnboardingText2()));
            },
          );
          timer.cancel();
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardingMessageViewModel>(
      // onModelReady: (model){
      //   model.initializeData(context);
      // },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Center(
            child: Text(
              displayMsg,
              style: AppStyles.onBoardingText(context),
            ),
          ),
        );
      },
    );
  }
}
