import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/enums/view_state.dart';
import 'package:momentmaster/core/service/base_model.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_text2.dart';

class OnBoardingMessageViewModel extends BaseModel {
  GetIt getIt = GetIt.instance;
  late List<String> onBoardingMsg;
  Timer? timer;
  int start = 0;
  String displayMsg = AppStrings.hello;

  void initializeData(BuildContext context) {
    setState(ViewState.BUSY);
    onBoardingMsg = [
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
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        getOnBoardingMsg(context);
      },
    );
    setState(ViewState.IDLE);
  }

  void getOnBoardingMsg(BuildContext context) {
    setState(ViewState.BUSY);
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const OnboardingText2(),
                ),
              );
            },
          );
          timer.cancel();
        }
      },
    );
    setState(ViewState.IDLE);
  }
}
