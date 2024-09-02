import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_9_second.dart';

class OnBoardingText7 extends StatefulWidget {
  const OnBoardingText7({super.key});

  @override
  _OnBoardingText7State createState() => _OnBoardingText7State();
}

class _OnBoardingText7State extends State<OnBoardingText7>
    with TickerProviderStateMixin {
  late AnimationController controller2;
  late Animation<Offset> animation2;

  void forAnimation() {
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    animation2 = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 1.0),
    ).animate(CurvedAnimation(parent: controller2, curve: Curves.easeIn));
  }

  @override
  void initState() {
    forAnimation();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation21, animation22) =>
              const OnBoardingText9Second(),
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
        position: animation2,
        child: Center(
          child: Text(AppStrings.isAboutYourRestPeriod,
              style: AppStyles.onBoardingTextMedium(context)),
        ),
      ),
    );
  }
}
