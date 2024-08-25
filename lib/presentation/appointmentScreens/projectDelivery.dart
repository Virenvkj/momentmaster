import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectDeliveryIcon extends StatelessWidget {
  const ProjectDeliveryIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
            size: const Size(30.0, 30.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: SvgPicture.string(
              '<svg viewBox="0.0 0.0 30.0 30.0" ><path transform="translate(0.0, 0.0)" d="M 29.87306213378906 0.9046778082847595 C 29.82773971557617 0.4960952997207642 29.50522422790527 0.173348069190979 29.09641456604004 0.1280285716056824 C 22.14068222045898 -0.6445011496543884 16.2112865447998 2.137979507446289 11.37468528747559 7.116752147674561 C 9.990541458129883 8.54163932800293 8.789971351623535 10.04984664916992 7.765195846557617 11.50540447235107 C 6.030835628509521 11.43490409851074 4.107867240905762 12.21956539154053 2.744554996490479 13.58287715911865 L 0.2582683265209198 16.06916236877441 C -0.02304674498736858 16.35047721862793 -0.08027101308107376 16.78584289550781 0.1186409294605255 17.13033485412598 C 0.3175528645515442 17.47482490539551 0.7229306697845459 17.64260864257813 1.107478380203247 17.53983306884766 C 1.684300422668457 17.38486862182617 2.621633768081665 17.20472526550293 3.522117614746094 17.16283798217773 C 3.851272583007813 17.14750099182129 4.124807357788086 17.15230941772461 4.352102756500244 17.16970443725586 C 3.803435325622559 18.22492408752441 3.382948160171509 19.10893058776855 3.243549823760986 19.33027076721191 C 3.025181531906128 19.67773628234863 3.075767755508423 20.12980842590332 3.366009950637817 20.42005348205566 L 4.804632186889648 21.85867500305176 C 2.710903882980347 24.71417617797852 2.676343202590942 26.17660140991211 2.683667898178101 26.38375663757324 C 2.699003934860229 26.82255363464355 3.041205644607544 27.23365592956543 3.607954025268555 27.23365592956543 C 4.098710060119629 27.23365592956543 5.506199836730957 27.02535629272461 8.068482398986816 25.12253379821777 L 9.581725120544434 26.63577079772949 C 9.874026298522949 26.92807579040527 10.33067989349365 26.97706031799316 10.67860412597656 26.75365447998047 C 10.91528415679932 26.60143852233887 11.74732780456543 26.19857788085938 12.74508953094482 25.67714881896973 C 12.76156997680664 26.42083740234375 12.66062545776367 27.51290702819824 12.44157123565674 28.99318695068359 C 12.31705188751221 29.83278465270996 13.33770847320557 30.33818817138672 13.93260955810547 29.74351692199707 L 16.41889762878418 27.25722885131836 C 17.70095252990723 25.97517395019531 18.44441223144531 24.07097434997559 18.38947677612305 22.2846565246582 C 19.9228630065918 21.21318435668945 21.51804733276367 19.94921112060547 23.00748634338379 18.48861312866211 C 27.93885803222656 13.65269660949707 30.63574409484863 7.768206596374512 29.87303733825684 0.9047060012817383 Z M 28.19158172607422 1.809281229972839 C 28.33189582824707 3.704556703567505 28.18219566345215 5.541685104370117 27.74614715576172 7.319536209106445 C 26.66323280334473 6.978478908538818 25.60457992553711 6.308495998382568 24.64847564697266 5.352619171142578 C 23.68893432617188 4.392852306365967 23.01758003234863 3.329852819442749 22.67789459228516 2.243046045303345 C 24.45505523681641 1.81340503692627 26.29333114624023 1.667825698852539 28.19158363342285 1.809285044670105 Z M 3.407470703125 15.40625190734863 L 3.987497329711914 14.82599544525146 C 4.689071178436279 14.12465190887451 5.601455688476563 13.61948013305664 6.508801937103271 13.39241409301758 C 6.034754753112793 14.14479827880859 5.612208843231201 14.86331176757813 5.239562034606934 15.5264253616333 C 4.663884162902832 15.39938735961914 4.023886203765869 15.37581157684326 3.407466888427734 15.40625476837158 Z M 5.070868492126465 19.6387996673584 C 5.261082649230957 19.26340866088867 5.491124629974365 18.79279708862305 5.913440227508545 17.99485969543457 L 7.070518016815186 19.15216445922852 C 6.639961719512939 19.61408042907715 6.251291751861572 20.05287551879883 5.901081562042236 20.46878623962402 L 5.070868492126465 19.6387996673584 Z M 9.369338989257813 19.30255126953125 C 10.00979518890381 18.66232109069824 10.62392997741699 18.54535484313965 11.38684368133545 18.52887916564941 C 11.37013339996338 19.27233695983887 11.25087928771973 19.90729713439941 10.61248588562012 20.54569625854492 C 7.883568286895752 23.27461433410645 6.013015747070313 24.4932689666748 4.89439582824707 25.03712463378906 C 5.446268081665039 23.89698791503906 6.668121337890625 22.00377464294434 9.369344711303711 19.30255126953125 Z M 10.35794830322266 24.92587661743164 L 9.451510429382324 24.01921081542969 C 9.865357398986816 23.66762351989746 10.30277824401855 23.27781295776367 10.76423740386963 22.84565353393555 L 11.99593162536621 24.07734870910645 C 11.1860933303833 24.50973701477051 10.84824275970459 24.67248725891113 10.35794162750244 24.92587661743164 Z M 15.17555332183838 26.0140552520752 L 14.47192287445068 26.7179126739502 C 14.5289192199707 25.86527061462402 14.50923347473145 25.24404525756836 14.42866230010986 24.76473426818848 C 15.07507038116455 24.40078544616699 15.77709579467773 23.98808097839355 16.51277351379395 23.52639770507813 C 16.30310440063477 24.45572280883789 15.83180236816406 25.35803413391113 15.17555332183838 26.0140552520752 Z M 13.59616088867188 23.19151496887207 L 12.02020263671875 21.61533164978027 C 13.18643379211426 20.33213233947754 13.14294910430908 19.09562492370605 13.14294910430908 17.65105628967285 C 13.14294910430908 17.16556358337402 12.74947357177734 16.77208709716797 12.26398181915283 16.77208709716797 C 10.91439819335938 16.77208709716797 9.615636825561523 16.69975662231445 8.299707412719727 17.89506149291992 L 6.794703960418701 16.39006042480469 C 10.90433120727539 9.183703422546387 15.65463256835938 4.621281147003174 20.99183654785156 2.742518663406372 C 21.41438102722168 4.109722137451172 22.2368106842041 5.427030563354492 23.40556144714355 6.595780372619629 C 24.56882095336914 7.759269237518311 25.87994956970215 8.57963752746582 27.24119567871094 9.0037841796875 C 25.35141944885254 14.31168937683105 20.7901668548584 19.05904769897461 13.5961742401123 23.19153785705566 Z M 13.59616088867188 23.19151496887207" fill="#3dbebe" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: const Rect.fromLTWH(14.7, 6.6, 8.8, 8.8),
            size: const Size(30.0, 30.0),
            fixedWidth: true,
            fixedHeight: true,
            child: SvgPicture.string(
              '<svg viewBox="14.7 6.6 8.8 8.8" ><path transform="translate(-235.53, -105.28)" d="M 257.687255859375 113.1183166503906 C 255.97509765625 111.4063720703125 253.1892395019531 111.4063720703125 251.477294921875 113.1183166503906 C 249.7653503417969 114.8304901123047 249.7653503417969 117.616340637207 251.477294921875 119.3282775878906 C 253.1892395019531 121.0402221679688 255.9751281738281 121.0404510498047 257.687255859375 119.3282775878906 C 259.3992309570313 117.6163330078125 259.3992309570313 114.8304748535156 257.687255859375 113.1183166503906 Z M 256.4452819824219 118.086296081543 C 255.4179992675781 119.1135559082031 253.7463073730469 119.1135559082031 252.7192993164063 118.086296081543 C 251.6920166015625 117.0590362548828 251.6920166015625 115.387565612793 252.7192993164063 114.3603134155273 C 253.746337890625 113.3332824707031 255.4177856445313 113.3330535888672 256.4452819824219 114.3603134155273 C 257.4725341796875 115.3875732421875 257.4725341796875 117.0590362548828 256.4452819824219 118.086296081543 Z M 256.4452819824219 118.086296081543" fill="#3dbebe" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}