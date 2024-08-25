import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_text2.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_text4.dart';

class OnBoardingText3 extends StatefulWidget {
  final String? firstName;
  const OnBoardingText3({super.key, this.firstName});
  @override
  _OnBoardingText3State createState() => _OnBoardingText3State();
}

class _OnBoardingText3State extends State<OnBoardingText3>
    with TickerProviderStateMixin {
  TextEditingController lastName = TextEditingController();
  late AnimationController controller1;
  late Animation<Offset> animation1;
  late AnimationController controller2;
  late Animation<double> animation2;
  bool enableButton = false;
  bool enableCrossButton = false;
  bool textError = false;

  void forAnimation() {
    controller2 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..forward();
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeOut);
    controller1 = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
    animation1 = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller1, curve: Curves.easeIn));
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
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Text(
              '${widget.firstName},',
              style: AppStyles.onBoardingTextMedium(context),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Flexible(
                  child: Text(
                    'What is your last name?',
                    style: AppStyles.onBoardingTextMedium(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            SlideTransition(
              position: animation1,
              child: FadeTransition(
                opacity: animation2,
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              autofocus: true,
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
                              decoration: const InputDecoration.collapsed(
                                  hintText: null),
                              keyboardType: TextInputType.text,
                              controller: lastName,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        enableCrossButton
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    lastName.clear();
                                    enableCrossButton = false;
                                  });
                                },
                                child: SvgPicture.string(
                                  AppStrings.crossButtonSvg,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            textError
                ? const Text(
                    AppStrings.textLimitingError,
                    style: TextStyle(color: AppColors.redDefault),
                  )
                : Container(),
            Flexible(
                child:
                    SizedBox(height: MediaQuery.of(context).size.height * 0.5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const OnboardingText2()));
                  },
                ),
                (enableButton && !textError)
                    ? IconButton(
                        color: AppColors.primaryGrey,
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => OnBoardingText4(
                                firstName: widget.firstName ?? '',
                                lastName: lastName.text,
                              ),
                            ),
                          );
                        },
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
