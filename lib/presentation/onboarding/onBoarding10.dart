import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onBoarding11.dart';

class OnBoardingText10 extends StatefulWidget {
  const OnBoardingText10({super.key});

  @override
  _OnBoardingText10State createState() => _OnBoardingText10State();
}

class _OnBoardingText10State extends State<OnBoardingText10>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  void forAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  void initState() {
    forAnimation();
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const OnBoardingText11(),
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
        child: Center(
          child: Text(AppStrings.toSetAppointments,
              style: AppStyles.onBoardingTextMedium(context)),
        ),
      ),
    );
  }
}
