import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentmaster/application/onboarding/check_user_name_view_model.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/enums/view_state.dart';
import 'package:momentmaster/core/service/base_view.dart';
import 'package:momentmaster/presentation/onboarding/onboarding_text3.dart';

class OnBoardingText4 extends StatefulWidget {
  final String firstName;
  final String lastName;
  const OnBoardingText4({
    super.key,
    required this.firstName,
    required this.lastName,
  });
  @override
  _OnBoardingText4State createState() => _OnBoardingText4State();
}

class _OnBoardingText4State extends State<OnBoardingText4>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

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
    return BaseView<CheckUserNameViewModel>(
     onModelReady: (model){
        model.initializeData();
      },
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          return AppConstants.circulerProgressIndicator();
        }
        return Scaffold(
          key: _scaffoldkey,
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
                  AppStrings.perfect,
                  style: AppStyles.onBoardingTextMedium(context),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  AppStrings.createUserName,
                  style: AppStyles.onBoardingTextMedium(context),
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
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp('[\\ ]')),
                                  ],
                                  autofocus: true,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        enableCrossButton = true;
                                      });

                                      if (value.length >= 6) {
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
                                  controller: model.userName,
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
                                        model.userName.clear();
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
                model.userNameUsed
                    ? const Text(
                        AppStrings.userNameTaken,
                        style: TextStyle(color: AppColors.redDefault),
                      )
                    : Container(),
                Flexible(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: AppColors.primaryGrey,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const OnBoardingText3()));
                      },
                    ),
                    (enableButton && !textError)
                        ? IconButton(
                            color: AppColors.primaryGrey,
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              model.checkUserName(context, widget.firstName,
                                  widget.lastName, model.userName.text);
                            },
                          )
                        : Container(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
