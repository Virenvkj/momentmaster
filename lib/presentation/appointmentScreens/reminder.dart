import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReminderIcon extends StatelessWidget {
  const ReminderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.047,
      height: MediaQuery.of(context).size.height * 0.047,
      child: SvgPicture.string(
        '<svg viewBox="38.0 407.8 15.5 16.1" ><path transform="translate(35.54, 405.58)" d="M 13.35603046417236 12.80634880065918 L 10.61797332763672 11.18138980865479 L 10.61797332763672 7.500856876373291 C 10.61797332763672 7.175865650177002 10.35798072814941 6.915871143341064 10.03298854827881 6.915871143341064 L 9.984238624572754 6.915871143341064 C 9.659247398376465 6.915871143341064 9.399252891540527 7.175864696502686 9.399252891540527 7.500856876373291 L 9.399252891540527 11.33576011657715 C 9.399252891540527 11.62012958526611 9.545499801635742 11.88824653625488 9.797368049621582 12.0344934463501 L 12.76291942596436 13.81382369995117 C 13.03916263580322 13.97631931304932 13.396653175354 13.8950719833374 13.55914878845215 13.61882877349854 C 13.72976875305176 13.33445930480957 13.64039707183838 12.96884441375732 13.35602855682373 12.80634880065918 Z M 17.67029762268066 4.486557960510254 L 15.16786003112793 2.406609773635864 C 14.82661819458008 2.122241735458374 14.31475639343262 2.16286563873291 14.0222635269165 2.512231826782227 C 13.73789501190186 2.853473424911499 13.78664302825928 3.365335464477539 14.12788486480713 3.657828092575073 L 16.6221981048584 5.737776279449463 C 16.96343994140625 6.022143840789795 17.47530174255371 5.98151969909668 17.76779556274414 5.632153034210205 C 18.0602855682373 5.29091215133667 18.01153755187988 4.779049873352051 17.67029571533203 4.486557006835938 Z M 3.793144702911377 5.737776279449463 L 6.287457466125488 3.657828569412231 C 6.636823654174805 3.365335702896118 6.685572624206543 2.853473663330078 6.393080234527588 2.512232065200806 C 6.108712196350098 2.162865877151489 5.596849918365479 2.122241973876953 5.255608558654785 2.406610012054443 L 2.753170967102051 4.486557960510254 C 2.411929607391357 4.779049873352051 2.363180637359619 5.29091215133667 2.655673503875732 5.632153987884521 C 2.940041303634644 5.98151969909668 3.451903581619263 6.022143840789795 3.793144702911377 5.737776279449463 Z M 10.2117338180542 3.665952920913696 C 6.173710346221924 3.665952920913696 2.899417400360107 6.94024658203125 2.899417400360107 10.97826957702637 C 2.899417400360107 15.01629257202148 6.173710346221924 18.29058647155762 10.2117338180542 18.29058647155762 C 14.24975681304932 18.29058647155762 17.52404975891113 15.01629257202148 17.52404975891113 10.97826957702637 C 17.52404975891113 6.94024658203125 14.24975681304932 3.665952920913696 10.2117338180542 3.665952920913696 Z M 10.2117338180542 16.66562652587891 C 7.075563430786133 16.66562652587891 4.52437686920166 14.11444187164307 4.52437686920166 10.97826957702637 C 4.52437686920166 7.842097282409668 7.075563430786133 5.29091215133667 10.2117338180542 5.29091215133667 C 13.34790420532227 5.29091215133667 15.89909172058105 7.842098236083984 15.89909172058105 10.97826957702637 C 15.89909172058105 14.11444187164307 13.34790420532227 16.66562652587891 10.2117338180542 16.66562652587891 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}
