import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/presentation/calendarScreens/common/linear_progress_bar.dart';
import 'package:momentmaster/presentation/common/common_bottom_appbar.dart';
import 'package:momentmaster/presentation/deadline/choose_deadline_period.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  List<Widget> tasks = [];

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
          NavigationService2.navigate(
            context,
            'pushRep',
            const ChooseDeadlinePeriod(),
          );
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: ListView(
              shrinkWrap: true,
              children: [
                AppConstants.sizer(0.05, 0, context),
                const LinearProgressBar(
                  value: 0.6,
                ),
                AppConstants.sizer(0.025, 0, context),
                Text(
                  AppStrings.aTodoListcanHelpYouForBetterPlanning,
                  style: AppStyles.quickSandText22Black(context),
                  textAlign: TextAlign.center,
                ),
                AppConstants.sizer(0.05, 0, context),
                Container(
                  child: Row(
                    children: [
                      FloatingActionButton(
                        backgroundColor: AppColors.primaryBlue,
                        onPressed: () {
                          setState(
                            () {
                              tasks.add(
                                Row(
                                  children: [
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xff3dbebe)),
                                      ),
                                    ),
                                    AppConstants.sizer(0, 0.05, context),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppStrings.task,
                                              style: AppStyles.greyColor_Size18(
                                                  context),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              AppStrings.time10mins,
                                              style: AppStyles.greyColor_Size18(
                                                  context),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    AppConstants.sizer(0.07, 0, context)
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                      AppConstants.sizer(0, 0.05, context),
                      Text(
                        AppStrings.addATodo,
                        style: AppStyles.lightGreyColor_Size18(),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                AppConstants.sizer(0.02, 0, context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return tasks[index];
                    },
                    itemCount: tasks.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
