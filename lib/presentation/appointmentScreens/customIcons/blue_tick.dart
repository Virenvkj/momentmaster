import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BlueTickIcon extends StatelessWidget {
  const BlueTickIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.09,
      height: MediaQuery.of(context).size.width * 0.09,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(0.0, 0.0, 34.0, 34.0),
            size: const Size(34.0, 34.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="0.0 0.0 34.0 34.0" ><path  d="M 0 0 L 34 0 L 34 34 L 0 34 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(2.8, 2.8, 28.3, 28.3),
            size: const Size(34.0, 34.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="2.8 2.8 28.3 28.3" ><path transform="translate(0.83, 0.83)" d="M 16.16666603088379 2 C 8.34666633605957 2 2 8.34666633605957 2 16.16666603088379 C 2 23.98666572570801 8.34666633605957 30.33333206176758 16.16666603088379 30.33333206176758 C 23.98666572570801 30.33333206176758 30.33333206176758 23.98666572570801 30.33333206176758 16.16666603088379 C 30.33333206176758 8.34666633605957 23.98666572570801 2 16.16666603088379 2 Z M 16.16666603088379 27.49999809265137 C 9.919166564941406 27.49999809265137 4.833333015441895 22.41416549682617 4.833333015441895 16.16666603088379 C 4.833333015441895 9.919166564941406 9.919166564941406 4.833333015441895 16.16666603088379 4.833333015441895 C 22.41416549682617 4.833333015441895 27.49999809265137 9.919166564941406 27.49999809265137 16.16666603088379 C 27.49999809265137 22.41416549682617 22.41416549682617 27.49999809265137 16.16666603088379 27.49999809265137 Z M 21.66333198547363 10.91083335876465 L 13.33333301544189 19.24083137512207 L 10.67000007629395 16.57749938964844 C 10.11750030517578 16.02499771118164 9.22499942779541 16.02499771118164 8.672499656677246 16.57749938964844 C 8.119999885559082 17.1299991607666 8.119999885559082 18.02249717712402 8.672499656677246 18.57499885559082 L 12.34166717529297 22.24416351318359 C 12.89416694641113 22.79666328430176 13.78666591644287 22.79666328430176 14.33916664123535 22.24416351318359 L 23.67499732971191 12.90833282470703 C 24.22749710083008 12.35583209991455 24.22749710083008 11.46333408355713 23.67499732971191 10.91083335876465 C 23.12249755859375 10.35833358764648 22.21582984924316 10.35833358764648 21.663330078125 10.91083335876465 Z" fill="#3dbebe" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
