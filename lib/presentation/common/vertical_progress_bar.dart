import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/presentation/common/animation_progress_bar.dart';

class VerticalProgressBar extends StatefulWidget {
  final int? progressValue;
  final double? width;
  final double? height;
  const VerticalProgressBar(
      {super.key, this.progressValue, this.width, this.height});
  @override
  _VerticalProgressBarState createState() => _VerticalProgressBarState();
}

class _VerticalProgressBarState extends State<VerticalProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 300,
      width: widget.width ?? 40,
      child: const FAProgressBar(
        backgroundColor: AppColors.lightGreyColor,
        displayTextStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 13,
          color: Color(0xff3dbebe),
          fontWeight: FontWeight.w500,
        ),
        maxValue: 100,
        //size: 30,
        border: Border(bottom: BorderSide.none),
        borderRadius: 50,
        progressColor: AppColors.primaryBlue,
        direction: Axis.vertical,
        verticalDirection: VerticalDirection.up,
        currentValue: 50,
        displayText: ' %',
      ),
    );
  }
}
