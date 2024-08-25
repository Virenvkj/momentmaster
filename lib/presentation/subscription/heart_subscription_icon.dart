import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:adobe_xd/pinned.dart';

class HeartSubscriptionIcon extends StatelessWidget {
  const HeartSubscriptionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68.0,
      height: 68.0,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(0.0, 0.0, 68.0, 68.0),
            size: const Size(68.0, 68.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="0.0 0.0 68.0 68.0" ><path  d="M 0 0 L 68 0 L 68 68 L 0 68 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(5.7, 8.5, 56.7, 50.0),
            size: const Size(68.0, 68.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="5.7 8.5 56.7 50.0" ><path transform="translate(3.66, 5.5)" d="M 34.16489028930664 51.53620529174805 C 32.01155471801758 53.49120330810547 28.69655799865723 53.49120330810547 26.54322052001953 51.50786590576172 L 26.2315559387207 51.22453308105469 C 11.35655212402344 37.76620483398438 1.638219356536865 28.95453643798828 2.006552219390869 17.96119689941406 C 2.176552057266235 13.14453220367432 4.641552925109863 8.526200294494629 8.636553764343262 5.806199550628662 C 16.11655426025391 0.7061996459960938 25.35321998596191 3.086199045181274 30.33988571166992 8.922865867614746 C 35.32655715942383 3.086199045181274 44.5632209777832 0.6778656244277954 52.0432243347168 5.806199550628662 C 56.0382194519043 8.526200294494629 58.50322341918945 13.14453220367432 58.67322158813477 17.96119689941406 C 59.06988906860352 28.95453643798828 49.32322311401367 37.76619720458984 34.44821929931641 51.28120803833008 L 34.16488647460938 51.53620910644531 Z" fill="#f16d70" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
