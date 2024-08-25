// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_text3.dart';

class OnboardingText2 extends StatefulWidget {
  const OnboardingText2({super.key});

  @override
  State<OnboardingText2> createState() => _OnboardingText2State();
}

class _OnboardingText2State extends State<OnboardingText2>
    with TickerProviderStateMixin {
  late AnimationController controllerForWhat;
  late Animation<Offset> animationForWhat;
  late AnimationController controllerForIs;
  late Animation<Offset> animationForIs;
  late AnimationController controllerForYour;
  late Animation<Offset> animationForYour;
  late AnimationController controllerForName;
  late Animation<Offset> animationForName;
  late AnimationController controllerForSo;
  late Animation<double> animationForSo2;
  late AnimationController controllerForSo2;
  late Animation<Offset> animationForSo;
  late AnimationController controllerForFName;
  late Animation<Offset> animationForFName;
  late AnimationController controllerForFName2;
  late Animation<double> animationForFName2;
  TextEditingController firstName = TextEditingController();
  bool activeRestAnimation = false;
  bool activeFName = false;
  bool enableButton = false;
  bool enableCrossButton = false;
  bool textError = false;
  bool enableAutoFocus = true;

  void forAnimation() {
    controllerForSo =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..forward();
    animationForSo2 =
        CurvedAnimation(parent: controllerForSo, curve: Curves.easeOut);
    controllerForSo2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    animationForSo = Tween<Offset>(
      begin: const Offset(0.0, 3.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controllerForSo2,
        curve: Curves.elasticInOut,
      ),
    );
    Future.delayed(
      const Duration(seconds: 3),
      () {
        controllerForWhat = AnimationController(
          duration: const Duration(milliseconds: 100),
          vsync: this,
        )..forward();
        animationForWhat = Tween<Offset>(
          begin: const Offset(0.0, 3.0),
          end: const Offset(0.0, 0.0),
        ).animate(
            CurvedAnimation(parent: controllerForWhat, curve: Curves.easeIn));
        controllerForIs = AnimationController(
          duration: const Duration(milliseconds: 200),
          vsync: this,
        )..forward();
        animationForIs = Tween<Offset>(
          begin: const Offset(0.0, 3.0),
          end: const Offset(0.0, 0.0),
        ).animate(
            CurvedAnimation(parent: controllerForIs, curve: Curves.easeIn));
        controllerForYour = AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: this,
        )..forward();
        animationForYour = Tween<Offset>(
          begin: const Offset(0.0, 3.0),
          end: const Offset(0.0, 0.0),
        ).animate(
            CurvedAnimation(parent: controllerForYour, curve: Curves.easeIn));
        controllerForName = AnimationController(
          duration: const Duration(milliseconds: 400),
          vsync: this,
        )..forward();
        animationForName = Tween<Offset>(
          begin: const Offset(0.0, 3.0),
          end: const Offset(0.0, 0.0),
        ).animate(
            CurvedAnimation(parent: controllerForName, curve: Curves.easeIn));
      },
    );
    Future.delayed(const Duration(seconds: 5), () {
      controllerForFName2 =
          AnimationController(duration: const Duration(seconds: 1), vsync: this)
            ..forward();
      animationForFName2 =
          CurvedAnimation(parent: controllerForFName2, curve: Curves.easeOut);
      controllerForFName = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      )..forward();
      animationForFName = Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: const Offset(0.0, 0.0),
      ).animate(
          CurvedAnimation(parent: controllerForFName, curve: Curves.easeIn));
    });
  }

  @override
  void initState() {
    forAnimation();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        activeRestAnimation = true;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        activeFName = true;
      });
    });
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        enableAutoFocus = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            SlideTransition(
              position: animationForSo,
              child: FadeTransition(
                opacity: animationForSo2,
                child: Text(
                  AppStrings.so,
                  style: AppStyles.onBoardingTextMedium(context),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            activeRestAnimation
                ? Row(
                    children: [
                      SlideTransition(
                        position: animationForWhat,
                        child: Text(AppStrings.what,
                            style: AppStyles.onBoardingTextMedium(context)),
                      ),
                      SlideTransition(
                        position: animationForIs,
                        child: Text(
                          AppStrings.isString,
                          style: AppStyles.onBoardingTextMedium(context),
                        ),
                      ),
                      SlideTransition(
                        position: animationForYour,
                        child: Text(AppStrings.your,
                            style: AppStyles.onBoardingTextMedium(context)),
                      ),
                      SlideTransition(
                        position: animationForName,
                        child: Text(AppStrings.nameWithQuestionMark,
                            style: AppStyles.onBoardingTextMedium(context)),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            activeFName
                ? SlideTransition(
                    position: animationForFName,
                    child: FadeTransition(
                      opacity: animationForFName2,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.898,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(
                                color: Colors.grey.shade50,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: TextField(
                                      autofocus: enableAutoFocus,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            enableCrossButton = true;
                                          });

                                          if (value.length >= 3) {
                                            setState(() {
                                              enableButton = true;
                                              if (value.length > 35) {
                                                setState(() {
                                                  textError = true;
                                                });
                                              } else {
                                                textError = false;
                                              }
                                            });
                                          } else {
                                            setState(() {
                                              enableButton = false;
                                            });
                                          }
                                        } else {
                                          setState(() {
                                            enableCrossButton = false;
                                          });
                                        }
                                      },
                                      decoration: const InputDecoration(
                                          hintText: null,
                                          counterText: '',
                                          isCollapsed: true,
                                          border: InputBorder.none),
                                      keyboardType: TextInputType.text,
                                      controller: firstName,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                enableCrossButton
                                    ? Container(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              firstName.clear();
                                              enableCrossButton = false;
                                            });
                                          },
                                          child: SvgPicture.string(
                                            AppStrings.crossButtonSvg,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            textError
                ? const Text(
                    AppStrings.textLimitingError,
                    style: TextStyle(color: Colors.red),
                  )
                : Container(),
            Flexible(
                child:
                    SizedBox(height: MediaQuery.of(context).size.height * 0.5)),
            (enableButton && !textError)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        color: AppColors.primaryGrey,
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => OnBoardingText3(
                              firstName: firstName.text,
                            ),
                          ));
                        },
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
