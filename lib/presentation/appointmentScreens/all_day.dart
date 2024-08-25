import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllDayIcon extends StatelessWidget {
  const AllDayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.06,
      height: MediaQuery.of(context).size.height * 0.028,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(0.0, 0.0, 20.0, 20.0),
            size: const Size(20.0, 20.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="0.0 0.0 20.0 20.0" ><path  d="M 0 0 L 20 0 L 20 20 L 0 20 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(1.7, 1.7, 16.7, 16.7),
            size: const Size(20.0, 20.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="1.7 1.7 16.7 16.7" ><path transform="translate(-0.33, -0.33)" d="M 10.32499885559082 2 C 5.724999904632568 2 2 5.733333587646484 2 10.33333301544189 C 2 14.93333339691162 5.724999904632568 18.66666603088379 10.32499885559082 18.66666603088379 C 14.93333339691162 18.66666603088379 18.66666603088379 14.93333339691162 18.66666603088379 10.33333301544189 C 18.66666603088379 5.733333110809326 14.93333339691162 2 10.32499885559082 2 Z M 10.33333301544189 17 C 6.650000095367432 17 3.666666507720947 14.01666641235352 3.666666507720947 10.33333301544189 C 3.666666507720947 6.650000095367432 6.650000095367432 3.666666507720947 10.33333301544189 3.666666507720947 C 14.01666641235352 3.666666507720947 17 6.650000095367432 17 10.33333301544189 C 17 14.01666641235352 14.01666641235352 17 10.33333301544189 17 Z M 10.14999961853027 6.166666507720947 L 10.09999847412109 6.166666507720947 C 9.766665458679199 6.166666507720947 9.499999046325684 6.433333396911621 9.499999046325684 6.766666889190674 L 9.499999046325684 10.69999980926514 C 9.499999046325684 10.99166679382324 9.649998664855957 11.26666641235352 9.908331871032715 11.41666603088379 L 13.36666584014893 13.49166584014893 C 13.64999866485596 13.65833282470703 14.01666641235352 13.57499980926514 14.18333148956299 13.29166603088379 C 14.35833072662354 13.00833320617676 14.2666654586792 12.63333320617676 13.97499847412109 12.46666622161865 L 10.74999904632568 10.54999923706055 L 10.74999904632568 6.766666412353516 C 10.74999904632568 6.433332920074463 10.48333263397217 6.166666507720947 10.14999866485596 6.166666507720947 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
