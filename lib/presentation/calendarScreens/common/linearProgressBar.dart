import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';

class LinearProgressBar extends StatefulWidget {
  final double? value;
  const LinearProgressBar({super.key, this.value});
  @override
  _LinearProgressBarState createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.greyMedium)),
      height: MediaQuery.of(context).size.height * 0.01,
      width: double.infinity,
      child: LinearProgressIndicator(
        backgroundColor: AppColors.greyMedium,
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
        value: widget.value,
      ),
    );
  }
}
