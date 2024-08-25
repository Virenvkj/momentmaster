import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/calendarScreens/calendar_screen1.dart';

class OnBoardingText13 extends StatefulWidget {
  const OnBoardingText13({super.key});

  @override
  _OnBoardingText13State createState() => _OnBoardingText13State();
}

class _OnBoardingText13State extends State<OnBoardingText13>
    with TickerProviderStateMixin {
  late AnimationController controller2;
  late Animation<double> animation2;

  void forAnimation() {
    controller2 = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..forward();
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeIn);
  }

  @override
  void initState() {
    super.initState();
    forAnimation();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CalendarScreen1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: animation2,
        child: Center(
          child: Text(
            AppStrings.calendarReady,
            style: AppStyles.onBoardingText(context),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
