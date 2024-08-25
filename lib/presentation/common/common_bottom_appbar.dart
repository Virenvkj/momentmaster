import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';

class CommonBottomAppBar extends StatefulWidget {
  final Function()? onPressLeft;
  final Function()? onPressRight;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final Color? leftIconColor;
  final Color? rightIconColor;
  const CommonBottomAppBar({
    super.key,
    this.onPressLeft,
    this.onPressRight,
    this.leftIcon,
    this.rightIcon,
    this.leftIconColor,
    this.rightIconColor,
  });

  @override
  _CommonBottomAppBarState createState() => _CommonBottomAppBarState();
}

class _CommonBottomAppBarState extends State<CommonBottomAppBar> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30),
            color: widget.leftIconColor ?? AppColors.primaryGrey,
            icon: SizedBox(child: widget.leftIcon),
            onPressed: widget.onPressLeft,
          ),
          IconButton(
            padding: const EdgeInsets.only(top: 20, bottom: 30, right: 30),
            color: widget.rightIconColor ?? AppColors.primaryGrey,
            icon: SizedBox(child: widget.rightIcon),
            onPressed: widget.onPressRight,
          ),
        ],
      ),
    );
  }
}
