import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/constants/app_styles.dart';
import 'package:momentmaster/core/service/bottom_sheet_service.dart';
import 'deadline_tracker_widget.dart';

class BottomSheet2 extends StatefulWidget {
  const BottomSheet2({super.key});

  @override
  _BottomSheet2State createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.004,
              width: MediaQuery.of(context).size.width * 0.2,
              color: const Color(0xffB6B6B6),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
            child: Text(
              AppStrings.findRightPlace,
              style: AppStyles.calendarText22(context),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              AppStrings.suggestedTime,
              style: AppStyles.calendarText13(context),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Center(
            child: Text(
              AppStrings.sundayTime,
              style: AppStyles.calendarText16(context),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Row(
              children: [
                IconButton(
                  color: const Color(0xff8b8888),
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      BottomSheetService.showBottomSheet(
                          context: context,
                          child: const DeadLineTrackerWidget());
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop();
                      BottomSheetService.showBottomSheet(
                          context: context,
                          child: const DeadLineTrackerWidget());
                    });
                  },
                  child: Text(
                    AppStrings.back,
                    style: AppStyles.calendarText13(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                ),
                Text(
                  AppStrings.time6to7,
                  style: AppStyles.calendarText22(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: MediaQuery.of(context).size.height * 0.0002,
                          width: double.infinity,
                          color: const Color(0xffB6B6B6),
                        ),
                        Row(
                          children: [
                            Text(
                              AppStrings.time19,
                              style: AppStyles.calendarText13(context),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: MediaQuery.of(context).size.height * 0.0002,
                          width: double.infinity,
                          color: const Color(0xffB6B6B6),
                        ),
                        Row(
                          children: [
                            Text(
                              AppStrings.time20,
                              style: AppStyles.calendarText13(context),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: MediaQuery.of(context).size.height * 0.0002,
                          width: double.infinity,
                          color: const Color(0xffB6B6B6),
                        ),
                        Row(
                          children: [
                            Text(
                              AppStrings.time21,
                              style: AppStyles.calendarText13(context),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.14,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.67,
                          decoration: const BoxDecoration(
                            color: Color(0xff3DBEBE),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                          ),
                          child: Row(
                            children: [
                              Center(
                                child: Text(
                                  'English Test - Preperation 04',
                                  style: AppStyles.roboto15(context),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              IconButton(
                                  alignment: Alignment.centerRight,
                                  color: Colors.white,
                                  icon: const Icon(Icons.flag_outlined),
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyLight,
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Center(
                    child: Text(
                      AppStrings.next,
                      style: AppStyles.calendarText16(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.001,
                    color: const Color(0xffB6B6B6),
                  ),
                ),
                InkWell(
                  child: Center(
                    child: Text(
                      AppStrings.select,
                      style: AppStyles.calendarText16(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        ],
      ),
    );
  }
}
