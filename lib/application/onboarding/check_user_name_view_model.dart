import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:momentmaster/core/constants/app_strings.dart';
import 'package:momentmaster/core/enums/view_state.dart';
import 'package:momentmaster/core/service/base_model.dart';
import 'package:momentmaster/presentation/onboarding/onBoarding5.dart';

GetIt getIt = GetIt.instance;

class CheckUserNameViewModel extends BaseModel {
  List<String> userNames = [];
  bool userNameUsed = false;
  TextEditingController userName = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;

  void checkUserName(BuildContext context, String firstName, String lastName,
      String userName) async {
    setState(ViewState.BUSY);
    userNames.clear();
    await firestoreInstance.collection("users").get().then(
      (value) {
        for (var element in value.docs) {
          userNames.add(element.data()['userName']);
        }

        if (userNames.contains(userName)) {
          userNameUsed = true;
        } else {
          addData(context, firstName, lastName, userName);
        }
      },
    );
    setState(ViewState.IDLE);
  }

  void initializeData(){
     setState(ViewState.BUSY);
     userName.clear();
     setState(ViewState.IDLE);
  }
  

  void addData(BuildContext context, String firstName, String lastName,
      String userName) async {
    setState(ViewState.BUSY);
    await firestoreInstance.collection("users").add(
      {
        AppStrings.firstName: firstName.toString(),
        AppStrings.lastName: lastName.toString(),
        AppStrings.userName: userName.toString(),
      },
    ).then(
      (value) {
        if (kDebugMode) {
          print('Firebase Doc Unique Id : ${value.id}');
        }
      },
    );
    if (!context.mounted) return;
    FocusScope.of(context).unfocus();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnBoardingText5(),
      ),
    );
    setState(ViewState.IDLE);
  }
}
