import 'package:flutter/material.dart';

class HashIcon extends StatelessWidget {
  const HashIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '#',
      style: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 25,
        color: Color(0xffffffff),
      ),
      textAlign: TextAlign.left,
    );
  }
}
