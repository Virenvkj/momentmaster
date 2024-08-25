// ignore_for_file: avoid_unnecessary_containers

import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_text1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  late Animation<Offset> animation1;
  late Animation<Offset> animation2;
  late Animation<double> animation3;
  late AnimationController controllerForBlueDot;
  late Animation<double> animationForBlueDot;
  late AnimationController controllerForText;
  late Animation<double> animationForText;
  bool blueDotAnimation = false;
  bool loadTextAnimation = false;

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    forAnimation();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          blueDotAnimation = true;
        });
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        loadTextAnimation = true;
      });
    });
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                const OnboardingText1(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      },
    );
  }

  void forAnimation() async {
    controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    controller2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    animation1 = Tween<Offset>(
      begin: const Offset(-2.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.elasticInOut,
      ),
    );
    animation2 = Tween<Offset>(
      begin: const Offset(2.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.elasticInOut,
      ),
    );

    Future.delayed(
      const Duration(seconds: 2),
      () {
        controllerForBlueDot = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 300),
        )..forward();

        animationForBlueDot = Tween<double>(begin: 1.0, end: 1.4).animate(
            CurvedAnimation(
                parent: controllerForBlueDot, curve: Curves.easeInBack));
        controllerForBlueDot.addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(const Duration(milliseconds: 300), () {
                controllerForBlueDot.reverse();
              });
            }
          },
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      controllerForText = AnimationController(
          duration: const Duration(milliseconds: 1000), vsync: this)
        ..forward();
      animationForText =
          CurvedAnimation(parent: controllerForText, curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 154,
            height: 155,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x00ffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0x00707070)),
                    ),
                  ),
                ),
                //Red Component
                SlideTransition(
                  position: animation1,
                  child: Container(
                    child: Pinned.fromSize(
                      bounds: const Rect.fromLTWH(24.5, 104.0, 102.9, 26.6),
                      size: const Size(154.0, 155.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: const Rect.fromLTWH(37.1, 0.0, 65.9, 26.6),
                            size: const Size(102.9, 26.6),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(72.03),
                                color: AppColors.primaryRed,
                              ),
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: const Rect.fromLTWH(0.0, 0.0, 26.6, 26.6),
                            size: const Size(102.9, 26.6),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(72.03),
                                color: AppColors.primaryRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Blue component part 2
                SlideTransition(
                  position: animation1,
                  child: Container(
                    child: Pinned.fromSize(
                      bounds: const Rect.fromLTWH(62.0, 24.4, 65.9, 26.6),
                      size: const Size(154.0, 155.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(72.03),
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                //Blue Component Part 1
                blueDotAnimation
                    ? ScaleTransition(
                        scale: animationForBlueDot,
                        child: Container(
                          child: Pinned.fromSize(
                            bounds: const Rect.fromLTRB(0.0, 0.0, 51.0, 51.0),
                            size: const Size(154.0, 155.0),
                            child: Stack(
                              children: <Widget>[
                                ScaleTransition(
                                  scale: animationForBlueDot,
                                  child: Container(
                                    child: Pinned.fromSize(
                                      bounds: const Rect.fromLTWH(
                                          0.0, 0.0, 51.0, 51.0),
                                      size: const Size(100.0, 200.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0x00ffffff),
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(
                                                  9999.0, 9999.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ScaleTransition(
                                  scale: animationForBlueDot,
                                  child: Container(
                                    child: Pinned.fromSize(
                                      bounds: const Rect.fromLTWH(
                                          24.4, 24.4, 26.6, 26.6),
                                      size: const Size(52.1, 51.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(
                                                  9999.0, 9999.0)),
                                          color: AppColors.primaryBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SlideTransition(
                        position: animation1,
                        child: Container(
                          child: Pinned.fromSize(
                            bounds: const Rect.fromLTWH(24.4, 24.4, 26.6, 26.6),
                            size: const Size(154.0, 155.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                        ),
                      ),
                //Orange Component Whole
                SlideTransition(
                  position: animation2,
                  child: Container(
                    child: Pinned.fromSize(
                      bounds: const Rect.fromLTWH(24.8, 64.2, 102.4, 26.6),
                      size: const Size(154.0, 155.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Pinned.fromSize(
                              bounds: const Rect.fromLTWH(0.0, 0.0, 65.9, 26.6),
                              size: const Size(102.4, 26.6),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(72.03),
                                  color: AppColors.primaryOrange,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Pinned.fromSize(
                              bounds:
                                  const Rect.fromLTWH(75.7, 0.0, 26.6, 26.6),
                              size: const Size(102.4, 26.6),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(72.03),
                                  color: AppColors.primaryOrange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          loadTextAnimation
              ? FadeTransition(
                  opacity: animationForText,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Scaffold(
                      backgroundColor: AppColors.whiteColor,
                      body: Center(
                        child: Text(
                          AppStrings.momentMaster,
                          style: AppStyles.onBoardingTextTitle(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
        ],
      ),
    );
  }
}
