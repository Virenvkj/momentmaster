import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onBoarding10.dart';

class OnBoardingText9 extends StatefulWidget {
  const OnBoardingText9({super.key});

  @override
  _OnBoardingText9State createState() => _OnBoardingText9State();
}

class _OnBoardingText9State extends State<OnBoardingText9>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  void forAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-1.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  void initState() {
    forAnimation();
    Future.delayed(
      const Duration(milliseconds: 1200),
      () {
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const OnBoardingText10(),
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
