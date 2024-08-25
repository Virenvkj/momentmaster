import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onBoarding7.dart';

class OnBoardingText6 extends StatefulWidget {
  const OnBoardingText6({super.key});

  @override
  _OnBoardingText6State createState() => _OnBoardingText6State();
}

class _OnBoardingText6State extends State<OnBoardingText6>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;
  late AnimationController controller2;
  late Animation<Offset> animation2;
  bool enableSecondAnimation = false;

  void forAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    animation = Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    forAnimation();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                const OnBoardingText7(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SlideTransition(
        position: animation,
        child: Center(
          child: Text(
            AppStrings.isAboutYourRestPeriod,
            style: AppStyles.onBoardingTextMedium(context),
          ),
        ),
      ),
    );
  }
}
