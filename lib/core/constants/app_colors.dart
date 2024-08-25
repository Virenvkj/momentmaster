import 'package:flutter/material.dart';

class AppColors {
  static const Color colorSetGreen = Color(0xff7FD5C2);
  static const Color colorSetRed = Color(0xffF16D70);
  static const Color colorSetPurple = Color(0xffF568FF);
  static const Color colorSetViolet = Color(0xffC368FF);
  static const Color colorSetOrange = Color(0xffFFBC47);
  static const Color colorSetBlue = Color(0xff5AD6D6);
  static const Color colorSetBrown = Color(0xffFFC481);
  static const Color colorSetGrey = Color(0xffB6B6B6);
  static const Color colorSetMagenta = Color(0xffFF33DD);
  static const Color settingsBlue = Color(0xff7adac4);
  static const Color settingsYellow = Color(0xffF1CC39);
  static const Color settingsRed = Color(0xffFF8585);
  static const Color settingsOrange = Color(0xFFFFC481);
  static const Color redDefault = Colors.red;
  static const Color greyLight = Color(0xFFFAFAFA);
  static const Color greyMedium = Color(0xffEEEEEE);
  static const Color primaryGrey = Color(0xff707070);
  static const Color primaryText = Color(0xff707070);
  static const Color primaryBlue = Color(0xff58cccc);
  static const Color primaryOrange = Color(0xffffac41);
  static const Color primaryRed = Color(0xfff16d70);
  static const Color primaryColor = Color(0xFF27BB8B);
  static Color yellow = const Color(0x00fffc00).withOpacity(1);
  static Color backgroundColor = const Color(0xFFEDEDEB);
  static const Color facebookButtonColor = Color(0xFF3b5998);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackFontColor = Color(0xFF333333);
  static const Color black = Color(0xFF000000);
  static const Color lightGreyColor = Color(0xFFDEDEDE);
  static const Color lightGrayDotColor = Color(0xFFD8D8D8);
  static const Color darkGrayColor = Color(0xFF777777);
  static const Color darkGrayLittleColor = Color(0xFF9B9B9B);
  static const Color lightGrayLittleColor = Color(0xFFDDDDDD);
  static const Color grayBackgroundColor = Color(0x00f7f7f7);
  static final Color amber = const Color(0x00ffb892).withOpacity(1);
  static final Color red = const Color(0x00f81b08).withOpacity(1);
  static final Color veryLightGrayColor =
      const Color(0x00f6f6f6).withOpacity(1);
  static final Color activeColor = const Color(0x0028be8c).withOpacity(1);

  static const Color greenLigthColorMarkerCircle1 =
      Color.fromRGBO(39, 187, 139, 0.09);
  static const Color greenLigthColorMarkerCircle2 =
      Color.fromRGBO(39, 187, 139, 0.06);
  static const Color greenLigthColorMarkerCircle3 =
      Color.fromRGBO(39, 187, 139, 0.04);

  static const Color green = Color.fromRGBO(39, 187, 139, 1);
  static final loginTopColor = const Color(0x00909cf2).withOpacity(1);

  static LinearGradient logInLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.0, .5],
    colors: [
      loginTopColor,
      const Color(0x0019365a).withOpacity(1),
    ],
  );
}
