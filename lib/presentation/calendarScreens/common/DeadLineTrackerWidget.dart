import 'package:flutter/material.dart';
import 'package:momentmaster/core/service/bottom_sheet_service.dart';
import 'package:momentmaster/presentation/calendarScreens/common/BottomSheet2.dart';

class DeadLineTrackerWidget extends StatefulWidget {
  const DeadLineTrackerWidget({super.key});

  @override
  _DeadLineTrackerWidgetState createState() => _DeadLineTrackerWidgetState();
}

class _DeadLineTrackerWidgetState extends State<DeadLineTrackerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0))),
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
          const Center(
            child: Text(
              'Deadline Tracker',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 22,
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Center(
            child: Text(
              'Show us how diligent you have been!',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 13,
                color: Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Center(
            child: Text(
              'English exam - #04',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Center(
            child: Text(
              'Friday, 20. October',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 16,
                color: Color(0xff8b8888),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Center(
            child: Text(
              '7.30pm - 8.30pm',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20,
                color: Color(0xff8b8888),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
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
                            const Text(
                              '19:00',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 13,
                                color: Color(0xff8b8888),
                              ),
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
                            const Text(
                              '20:00',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 13,
                                color: Color(0xff8b8888),
                              ),
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
                            const Text(
                              '21:00',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 13,
                                color: Color(0xff8b8888),
                              ),
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
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pop();
                              BottomSheetService.showBottomSheet(
                                  context: context,
                                  child: const BottomSheet2());
                            });
                          },
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
                                const Center(
                                  child: Text(
                                    'English Test - Preperation 04',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade50,
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    //showBottomSheet2();
                  },
                  child: const Center(
                    child: Text(
                      'No, postpone',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 17,
                        color: Color(0xfff16d70),
                        fontWeight: FontWeight.w500,
                      ),
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
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Center(
                    child: Text(
                      '    Done!    ',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 17,
                        color: Color(0xff3dbebe),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          const Center(
            child: Text(
              'Postpone manual',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14,
                color: Color(0xff8B8888),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: Color(0xff3dbebe),
                    ),
                    child: const Text('  '),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: Color(0xffB6B6B6),
                    ),
                    child: const Text('  '),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: Color(0xffB6B6B6),
                    ),
                    child: const Text('  '),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: Color(0xffB6B6B6),
                    ),
                    child: const Text('  '),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: Color(0xffB6B6B6),
                    ),
                    child: const Text('  '),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: Color(0xffB6B6B6),
                    ),
                    child: const Text('  '),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
