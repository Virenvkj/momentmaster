import 'package:flutter/material.dart';

class PinkIcon extends StatelessWidget {
  const PinkIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.05,
      height: MediaQuery.of(context).size.height * 0.025,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xffeb93dd),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
    );
  }
}
