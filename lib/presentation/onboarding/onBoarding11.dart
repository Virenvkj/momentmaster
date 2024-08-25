import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onBoarding12.dart';

class OnBoardingText11 extends StatefulWidget {
  const OnBoardingText11({super.key});

  @override
  _OnBoardingText11State createState() => _OnBoardingText11State();
}

class _OnBoardingText11State extends State<OnBoardingText11>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;
  late AnimationController controller2;
  late Animation<double> animation2;
  late AnimationController controllerForTime;
  late Animation<Offset> animationForTime;
  late AnimationController controllerForTime2;
  late Animation<double> animationForTime2;
  TextEditingController restHourBegin = TextEditingController();
  TextEditingController restMinsBegin = TextEditingController();
  TextEditingController timeFormatBegin = TextEditingController();
  bool enableTimeAnimation = false;

  List<Text> hourList = [];
  List<Text> minuteList = [];
  List<String> meridians = [AppStrings.am, AppStrings.pm];
  List<Text> meridianList = [];

  List<Text> getHour() {
    hourList.clear();
    for (int i = 1; i <= 12; i++) {
      hourList.add(
        Text(
          i.toString(),
          style: AppStyles.greyColor_Size40(),
        ),
      );
    }
    return hourList;
  }

  List<Text> getMeridian(BuildContext context) {
    meridianList.clear();
    for (int i = 0; i <= 1; i++) {
      meridianList.add(
        Text(
          meridians[i],
          style: AppStyles.darkGreyColor1_Size20(context),
        ),
      );
    }
    return meridianList;
  }

  List<Text> getMinutes() {
    minuteList.clear();
    for (int i = 1; i < 60; i++) {
      minuteList.add(
        Text(
          i.toString(),
          style: AppStyles.greyColor_Size40(),
        ),
      );
    }
    return minuteList;
  }

  void forAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    animation = Tween<Offset>(
      begin: const Offset(0.0, -0.5),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller2 = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..forward();
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeIn);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        controllerForTime = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        )..forward();

        animationForTime = Tween<Offset>(
          begin: const Offset(0.0, -0.6),
          end: const Offset(0.0, -0.5),
        ).animate(
            CurvedAnimation(parent: controllerForTime, curve: Curves.easeIn));
        controllerForTime2 = AnimationController(
            duration: const Duration(milliseconds: 500), vsync: this)
          ..forward();
        animationForTime2 =
            CurvedAnimation(parent: controllerForTime2, curve: Curves.easeIn);
      },
    );
  }

  @override
  void initState() {
    forAnimation();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          enableTimeAnimation = true;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          SlideTransition(
            position: animation,
            child: FadeTransition(
              opacity: animation2,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Text(
                  AppStrings.restPeriodBegin,
                  style: AppStyles.onBoardingTextMedium(context),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          enableTimeAnimation
              ? Expanded(
                  child: Center(
                    child: SlideTransition(
                      position: animationForTime,
                      child: FadeTransition(
                        opacity: animationForTime2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.13,
                                child: CupertinoPicker(
                                  looping: true,
                                  itemExtent: 50,
                                  backgroundColor: AppColors.whiteColor,
                                  onSelectedItemChanged: null,
                                  children: getHour(),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      ':',
                                      style: TextStyle(
                                        color: AppColors.primaryGrey,
                                        fontSize: 30,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.13,
                                child: CupertinoPicker(
                                  looping: true,
                                  itemExtent: 50,
                                  backgroundColor: AppColors.whiteColor,
                                  onSelectedItemChanged: null,
                                  children: getMinutes(),
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    color: AppColors.whiteColor,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    child: CupertinoPicker(
                                      looping: true,
                                      itemExtent: 50,
                                      backgroundColor: AppColors.whiteColor,
                                      onSelectedItemChanged: null,
                                      children: getMeridian(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
          ),
          enableTimeAnimation
              ? Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        color: AppColors.primaryGrey,
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const OnBoardingText12(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
