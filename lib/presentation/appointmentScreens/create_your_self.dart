import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateYourselfIcon extends StatelessWidget {
  const CreateYourselfIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18.0,
      height: 18.0,
      child: Stack(
        children: <Widget>[
          SvgPicture.string(
            '<svg viewBox="3.0 3.0 18.1 18.1" ><path  d="M 3 12 C 2.997416973114014 11.48452186584473 3.387098789215088 11.05154132843018 3.900000333786011 11 L 20.10000038146973 11 C 20.65228462219238 11 21.10000038146973 11.44771575927734 21.10000038146973 12 C 21.10000038146973 12.55228519439697 20.65228462219238 13 20.10000038146973 13 L 3.900000095367432 13 C 3.387098789215088 12.94845867156982 2.997416734695435 12.51547813415527 3.000000238418579 12 Z" fill="#3dbebe" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path  d="M 12 3 C 12.51547813415527 2.997416973114014 12.94845867156982 3.387098789215088 13 3.900000095367432 L 13 20.10000038146973 C 13 20.65228462219238 12.55228424072266 21.10000038146973 12 21.10000038146973 C 11.44771480560303 21.10000038146973 11 20.65228462219238 11 20.10000038146973 L 11 3.900000095367432 C 11.05154132843018 3.387098789215088 11.48452186584473 2.997416734695435 12 3.000000238418579 Z" fill="#3dbebe" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
          ),
        ],
      ),
    );
  }
}
