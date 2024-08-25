// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onBoarding6.dart';

class OnBoardingText5 extends StatefulWidget {
  const OnBoardingText5({super.key});

  @override
  _OnBoardingText5State createState() => _OnBoardingText5State();
}

class _OnBoardingText5State extends State<OnBoardingText5>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  void forAnimation() {
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  void initState() {
    forAnimation();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => const OnBoardingText6()));
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: animation,
        child: Center(
          child: Text(AppStrings.theLastQuestion,
              style: AppStyles.onBoardingTextMedium(context)),
        ),
      ),
    );
  }
}
