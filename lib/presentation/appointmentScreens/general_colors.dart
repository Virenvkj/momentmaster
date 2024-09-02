import 'package:flutter/material.dart';

class GeneralColorsIcon extends StatelessWidget {
  const GeneralColorsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.025,
          width: MediaQuery.of(context).size.width * 0.05,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            color: Color(0xfff16d70),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.025,
          width: MediaQuery.of(context).size.width * 0.05,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            color: Color(0xffffbc47),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.025,
          width: MediaQuery.of(context).size.width * 0.05,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            color: Color(0xff3dbebe),
          ),
        ),
      ],
    );
  }
}
