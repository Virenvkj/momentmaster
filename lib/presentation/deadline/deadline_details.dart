import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/calendarScreens/common/linear_progress_bar.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/deadline/create_todo.dart';

class DeadlineDetailsScreen extends StatefulWidget {
  const DeadlineDetailsScreen({super.key});

  @override
  _DeadlineDetailsScreenState createState() => _DeadlineDetailsScreenState();
}

class _DeadlineDetailsScreenState extends State<DeadlineDetailsScreen>
    with TickerProviderStateMixin {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool enableAutoFocus = false;
  late AnimationController controller1;
  late Animation<Offset> animation1;
  late AnimationController controller2;
  late Animation<double> animation2;
  bool autoValidation = false;

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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: CommonBottomAppBar(
        leftIcon: const Icon(Icons.arrow_back),
        rightIcon: const Icon(Icons.arrow_forward),
        onPressLeft: () {
          Navigator.of(context).pop();
        },
        onPressRight: () {
          setState(
            () {
              FocusNode().unfocus();
              if (formKey.currentState?.validate() ?? false) {
                NavigationService2.navigate(
                  context,
                  'pushRep',
                  const CreateTodoScreen(),
                );
              } else {
                setState(() {
                  autoValidation = true;
                });
              }
            },
          );
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              AppConstants.sizer(0.05, 0, context),
              const LinearProgressBar(
                value: 0.45,
              ),
              AppConstants.sizer(0.025, 0, context),
              Text(
                AppStrings.greatTellMeMoreAboutYourExam,
                style: AppStyles.quickSandText22Black(context),
                textAlign: TextAlign.center,
              ),
              AppConstants.sizer(0.12, 0, context),
              SlideTransition(
                position: animation1,
                child: FadeTransition(
                  opacity: animation2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.title,
                        style: AppStyles.greyColor_Size20(),
                        textAlign: TextAlign.left,
                      ),
                      TextFormField(
                        style: AppStyles.mediumgreyColor_Size20(),
                        autofocus: enableAutoFocus,
                        decoration: const InputDecoration(
                            hintText: null,
                            counterText: '',
                            isCollapsed: true,
                            border: InputBorder.none),
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'Please enter Title';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              AppConstants.sizer(0.08, 0, context),
              SlideTransition(
                position: animation1,
                child: FadeTransition(
                  opacity: animation2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.description,
                        style: AppStyles.greyColor_Size20(),
                        textAlign: TextAlign.left,
                      ),
                      TextFormField(
                        style: AppStyles.mediumgreyColor_Size20(),
                        decoration: const InputDecoration(
                            hintText: null,
                            counterText: '',
                            isCollapsed: true,
                            border: InputBorder.none),
                        keyboardType: TextInputType.text,
                        controller: descriptionController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'Please enter Description';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              AppConstants.sizer(0.08, 0, context),
              SlideTransition(
                position: animation1,
                child: FadeTransition(
                  opacity: animation2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.location,
                        style: AppStyles.greyColor_Size20(),
                        textAlign: TextAlign.left,
                      ),
                      TextFormField(
                        style: AppStyles.mediumgreyColor_Size20(),
                        decoration: const InputDecoration(
                            hintText: null,
                            counterText: '',
                            isCollapsed: true,
                            border: InputBorder.none),
                        keyboardType: TextInputType.text,
                        controller: locationController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'Please enter Location';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
