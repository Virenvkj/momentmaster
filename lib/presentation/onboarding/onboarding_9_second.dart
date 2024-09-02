import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_nine_3.dart';

class OnBoardingText9Second extends StatefulWidget {
  const OnBoardingText9Second({super.key});

  @override
  _OnBoardingText9SecondState createState() => _OnBoardingText9SecondState();
}

class _OnBoardingText9SecondState extends State<OnBoardingText9Second>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  void forAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
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
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                const OnBoardingText9Third(),
            transitionDuration: const Duration(seconds: 1),
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
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              AppStrings.youCanSpecifyATimePeriod,
              style: AppStyles.onBoardingTextMedium(context),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
