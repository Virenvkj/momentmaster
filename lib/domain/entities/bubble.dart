import 'package:flutter/material.dart';

class Bubble {
  const Bubble({
    required this.title,
    required this.titleStyle,
    required this.iconColor,
    required this.bubbleColor,
    required this.icon,
    required this.onPress,
  });

  final IconData icon;
  final Color iconColor;
  final Color bubbleColor;
  final Function() onPress;
  final String title;
  final TextStyle titleStyle;
}
