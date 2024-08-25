import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/domain/entities/bubble.dart';

class BubbleMenu extends StatelessWidget {
  const BubbleMenu(this.item, {super.key});

  final Bubble item;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      padding: const EdgeInsets.only(top: 11, bottom: 13, left: 20, right: 20),
      color: item.bubbleColor,
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.1),
      elevation: 2,
      highlightElevation: 2,
      disabledColor: item.bubbleColor,
      onPressed: item.onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.32,
            child: Text(
              item.title,
              style: const TextStyle(
                  fontFamily: 'Roboto',
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Icon(
            item.icon,
            color: item.iconColor,
          )
        ],
      ),
    );
  }
}
