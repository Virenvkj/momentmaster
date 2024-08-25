import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onBoarding13.dart';

class OnBoardingText12 extends StatefulWidget {
  const OnBoardingText12({super.key});

  @override
  _OnBoardingText12State createState() => _OnBoardingText12State();
}

class _OnBoardingText12State extends State<OnBoardingText12>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;
  late AnimationController controller2;
  late Animation<double> animation2;
  TextEditingController restHourEnd = TextEditingController();
  TextEditingController restMinsEnd = TextEditingController();
  TextEditingController timeFormatEnd = TextEditingController();

  List<Text> hourList = [];
  List<Text> minuteList = [];
  List<Text> meridianList = [
    Text(
      AppStrings.am,
      style: AppStyles.darkGreyColor_Size20(),
      textAlign: TextAlign.center,
    ),
    Text(
      AppStrings.pm,
      style: AppStyles.darkGreyColor_Size20(),
      textAlign: TextAlign.center,
    ),
  ];
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

  List<Text> getMeridian() {
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
      begin: const Offset(0.0, -0.6),
      end: const Offset(0.0, -0.5),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller2 = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..forward();
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeIn);
  }

  @override
  void initState() {
    forAnimation();
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
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Text(AppStrings.restPeriodEnd,
                style: AppStyles.onBoardingTextMedium(context)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Expanded(
            child: Center(
              child: SlideTransition(
                position: animation,
                child: FadeTransition(
                  opacity: animation2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
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
                          height: MediaQuery.of(context).size.height * 0.06,
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
                          height: MediaQuery.of(context).size.height * 0.06,
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.13,
                              child: CupertinoPicker(
                                looping: true,
                                itemExtent: 50,
                                backgroundColor: AppColors.whiteColor,
                                onSelectedItemChanged: null,
                                children: getMeridian(),
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  color: AppColors.primaryGrey,
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const OnBoardingText13()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
