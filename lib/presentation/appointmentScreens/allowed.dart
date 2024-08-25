import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:adobe_xd/pinned.dart';

class AllowedIcon extends StatelessWidget {
  const AllowedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22.0,
      height: 22.0,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(0.0, 0.0, 21.9, 21.9),
            size: const Size(21.9, 21.9),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="0.0 0.0 21.9 21.9" ><path  d="M 0 0 L 21.89794921875 0 L 21.89794921875 21.89794921875 L 0 21.89794921875 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(3.6, 4.6, 15.5, 14.0),
            size: const Size(21.9, 21.9),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: SvgPicture.string(
              '<svg viewBox="3.6 4.6 15.5 14.0" ><path transform="translate(-0.35, -0.44)" d="M 4.91241455078125 6.8248291015625 L 17.68621826171875 6.8248291015625 C 18.18804550170898 6.8248291015625 18.5986328125 6.414242744445801 18.5986328125 5.91241455078125 C 18.5986328125 5.410586357116699 18.18804550170898 5 17.68621826171875 5 L 4.91241455078125 5 C 4.410586357116699 5 4 5.410586357116699 4 5.91241455078125 C 4 6.414242744445801 4.410586357116699 6.8248291015625 4.91241455078125 6.8248291015625 Z M 15.70627880096436 10.4744873046875 L 4.91241455078125 10.4744873046875 C 4.410586357116699 10.4744873046875 4 10.88507270812988 4 11.38690185546875 C 4 11.8887300491333 4.410586357116699 12.29931640625 4.91241455078125 12.29931640625 L 15.98000431060791 12.29931640625 C 16.89241790771484 12.29931640625 17.74096488952637 12.91063404083252 17.88694953918457 13.81392383575439 C 18.07855606079102 14.95444202423096 17.19351387023926 15.948974609375 16.0894947052002 15.948974609375 L 14.03656005859375 15.948974609375 L 14.03656005859375 15.22816562652588 C 14.03656005859375 14.8175802230835 13.54385662078857 14.61684799194336 13.26100730895996 14.90882015228271 L 11.62778568267822 16.54203987121582 C 11.44530296325684 16.72452545166016 11.44530296325684 17.00737190246582 11.62778568267822 17.18985366821289 L 13.26100730895996 18.82307624816895 C 13.55297946929932 19.11505126953125 14.03656005859375 18.90519523620605 14.03656005859375 18.50373268127441 L 14.03656005859375 17.7738037109375 L 15.86138916015625 17.7738037109375 C 17.99643898010254 17.7738037109375 19.70265197753906 15.93984889984131 19.4927978515625 13.76830387115479 C 19.3103141784668 11.87048244476318 17.61322402954102 10.47448825836182 15.70627880096436 10.47448825836182 Z M 8.56207275390625 15.948974609375 L 4.91241455078125 15.948974609375 C 4.410586357116699 15.948974609375 4 16.35956192016602 4 16.86138916015625 C 4 17.36321640014648 4.410586357116699 17.7738037109375 4.91241455078125 17.7738037109375 L 8.56207275390625 17.7738037109375 C 9.063901901245117 17.7738037109375 9.4744873046875 17.36321640014648 9.4744873046875 16.86138916015625 C 9.4744873046875 16.35956192016602 9.063901901245117 15.948974609375 8.56207275390625 15.948974609375 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}