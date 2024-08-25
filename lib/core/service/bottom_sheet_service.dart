import 'package:flutter/material.dart';

class BottomSheetService {
  static void showBottomSheet(
      {required BuildContext context, required Widget child}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}
