import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onBoarding9.dart';

class OnBoardingText8 extends StatefulWidget {
  const OnBoardingText8({super.key});

  @override
  _OnBoardingText8State createState() => _OnBoardingText8State();
}

class _OnBoardingText8State extends State<OnBoardingText8>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  void forAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    animation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  void initState() {
    forAnimation();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const OnBoardingText9(),
          transitionDuration: const Duration(seconds: 0),
        ));
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
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              AppStrings.inWhichWeAreNotAllowed,
              style: AppStyles.onBoardingTextMedium(context),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
