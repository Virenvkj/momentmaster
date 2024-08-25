// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  late double appBarHeight;

  //font Size
  late double fontSize40;
  late double fontSize28;
  late double fontSize16;
  late double fontSize15;
  late double fontSize13;
  late double fontSize25;
  late double fontSize22;
  late double fontSize18;
  late double fontSize17;
  late double fontSize14;

  //font size
  static late double fontSizeLargeExtraLarge;
  static late double fontSizeMedium;

  static late double fontSizeVerySmall;
  static double fontSizeSmall = 11;
  static late double fontSizeLarge;
  static late double fontSizeLarger;
  static late double fontSizeLargeVeryLarge;
  static late double fontSize20;
  static late double fontSizeSmallVeryMedium;
  static late double fontSizeLargest;
  static late double fontSizeLargestBig;
  static late double cameraContainerSize;
  static late double fileImageContainerSize;

  //radius
  late double introGetStartedButtonRadius;
  late double radiusSmall;
  late double radiusBig;
  static double borderRadius = 20;

  //icon size
  late double iconSize;
  late double tabIconSize;
  late double smallIconSize;
  late double mediumIconSize;
  late double smallerIconSize;

  //distance from views to screenBorder
  late double horizontalGap;
  late double appBarIconSize;
  late double verticalGap;
  static double textFieldHeight = 55;
  static double mediumIcon = 30;
  static double largeIcon = 40;
  static double serachAppbarheight = 70;

  // vertical spacing constants. Adjust to your liking.
  late double _verticalSpaceSmall;
  late double _verticalSpaceSmallMedium;
  late double _verticalSpaceExtraMedium;
  late double _verticalSpaceBigMedium;
  late double _verticalSpaceLarge;
  late double _verticalSpaceELarge;
  late double _verticalSpaceLargeBig;
  late double _verticalSpaceBig;
  late double containerHeightWidthLarge;

  sizeConfigInit(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    int orgScreenWidth = screenWidth.round();
    int orgScreenHeight = screenHeight.round();

    appBarHeight = 105;

    fontSizeLargeExtraLarge = 28;
    cameraContainerSize = 350;
    fileImageContainerSize = 390;
    fontSizeMedium = 14;
    fontSizeVerySmall = 8;
    fontSizeSmallVeryMedium = 12;
    fontSizeLarge = 16;
    fontSizeLarger = 18;
    fontSizeLargeVeryLarge = 24;
    fontSize20 = 20;
    fontSizeLargest = 22;
    fontSizeLargestBig = 28;
    smallIconSize = 15;
    smallerIconSize = 12;
    mediumIconSize = 25;

    //radius
    introGetStartedButtonRadius = orgScreenHeight * 0.02;
    radiusSmall = orgScreenHeight * 0.01;
    radiusBig = orgScreenHeight * 0.03;
    iconSize = orgScreenWidth * 0.05;
    tabIconSize = orgScreenHeight * 0.03;

    horizontalGap = screenWidth * .09;
    appBarIconSize = 24;
    verticalGap = screenHeight * .015;

    _verticalSpaceSmall = screenHeight * 0.01;
    _verticalSpaceSmallMedium = screenHeight * 0.02;
    _verticalSpaceBigMedium = screenHeight * 0.05;
    _verticalSpaceLarge = screenHeight * 0.07;
    _verticalSpaceELarge = screenHeight * .11;
    _verticalSpaceLargeBig = screenHeight * 0.14;
    _verticalSpaceBig = screenHeight * 0.12;
    containerHeightWidthLarge = screenHeight * .15;
  }

  // vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double HorizontalSpaceLarge = 60.0;
  static const double HorizontalSpaceBig = 40.0;

  //image height
  static const double smallerImageHeight = 45;
  static const double smallImageHeight55 = 55;
  static const double smallImageHeight60 = 60;

  static const double smallImageHeight = 80;
  static const double orderStatusContainerHeight = 235;
  static const double imageHeight90 = 90;
  static const double smallerImageHeight75 = 75;
  static const double mediumImageHeight = 100;
  static const double BigImageHeight = 120;
  static const double BiggerImageHeight = 130;
  static const double imageHeight140 = 140;
  static const double buttonHeight = 55;

  /// Returns a vertical space with height set to [_verticalSpaceSmall]
  Widget verticalSpaceSmall() {
    return verticalSpace(_verticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_verticalSpaceSmallMedium]
  Widget verticalSpaceSmallMedium() {
    return verticalSpace(_verticalSpaceSmallMedium);
  }

  Widget verticalSpaceExtraLarge() {
    return verticalSpace(_verticalSpaceELarge);
  }

  static Widget cVerticalSpaceSmallMedium() {
    return verticalSpace(10);
  }

  static Widget cVerticalSpaceSmallMediumC11() {
    return verticalSpace(11);
  }

  static Widget cVerticalSpaceSmallMediumC12() {
    return verticalSpace(12);
  }

  static Widget cVerticalSpacevMedium() {
    return verticalSpace(15);
  }

  static Widget cVerticalSpacevarySmall() {
    return verticalSpace(5);
  }

  static Widget cVerticalSpaceMedium() {
    return verticalSpace(20);
  }

  static Widget cVerticalSpaceMedium25() {
    return verticalSpace(25);
  }

  static Widget cVerticalSpacevEMedium() {
    return verticalSpace(30);
  }

  static Widget cVerticalSpaceBig() {
    return verticalSpace(40);
  }

  static Widget cVerticalSpaceBig43() {
    return verticalSpace(43);
  }

  static Widget cVerticalSpaceBigger() {
    return verticalSpace(50);
  }

  static Widget cVerticalSpace55() {
    return verticalSpace(55);
  }

  static Widget cVerticalSpace60() {
    return verticalSpace(60);
  }

  static Widget cVerticalSpaceExtraBig() {
    return verticalSpace(70);
  }

  static Widget cVerticalSpaceExtra80() {
    return verticalSpace(80);
  }

  static Widget cVerticalSpaceExtra90() {
    return verticalSpace(90);
  }

  static Widget cVerticalSpaceExtra110() {
    return verticalSpace(110);
  }

  /// Returns a vertical space with height set to [verticalSpaceMedium]

  Widget verticalSpaceExtraMedium() {
    return verticalSpace(_verticalSpaceExtraMedium);
  }

  Widget verticalSpaceBigMedium() {
    return verticalSpace(_verticalSpaceBigMedium);
  }

  /// Returns a vertical space with height set to [_verticalSpaceLarge]
  Widget verticalSpaceLarge() {
    return verticalSpace(_verticalSpaceLarge);
  }

  Widget verticalSpaceLargeBig() {
    return verticalSpace(_verticalSpaceLargeBig);
  }

  Widget verticalSpaceBig() {
    return verticalSpace(_verticalSpaceBig);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  static EdgeInsets get constantSidePadding =>
      const EdgeInsets.only(left: 20, right: 20);
  static EdgeInsets get constantPadding =>
      const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20);
  EdgeInsets get topIconPadding =>
      EdgeInsets.only(right: screenWidth * 0.04, top: screenHeight * .08);

  EdgeInsets get sidepadding =>
      EdgeInsets.only(left: screenWidth * 0.04, right: screenWidth * 0.04);
  EdgeInsets get sidelargepadding => const EdgeInsets.only(left: 30, right: 30);
  EdgeInsets get innersidepadding =>
      EdgeInsets.only(left: screenWidth * 0.02, right: screenWidth * 0.02);
  EdgeInsets get innerMediumPadding => EdgeInsets.only(
      left: screenWidth * 0.03,
      right: screenWidth * 0.03,
      top: screenHeight * .008,
      bottom: screenHeight * .008);
  EdgeInsets get padding => EdgeInsets.only(
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
      top: screenHeight * .01,
      bottom: screenHeight * .01);
  EdgeInsets get paddingMediumhighSide => EdgeInsets.only(
      left: screenWidth * 0.043,
      right: screenWidth * 0.043,
      top: screenHeight * .016,
      bottom: screenHeight * .016);
  EdgeInsets get smallpadding => EdgeInsets.only(
      left: screenWidth * 0.02,
      right: screenWidth * 0.02,
      top: screenHeight * .005,
      bottom: screenHeight * .005);
  EdgeInsets get paddingWihLittleHeight => EdgeInsets.only(
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
      top: screenHeight * .015,
      bottom: screenHeight * .015);
  EdgeInsets get paddingWihLittleHeight018 => EdgeInsets.only(
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
      top: screenHeight * .018,
      bottom: screenHeight * .018);
  EdgeInsets get mediumpadding => EdgeInsets.only(
      left: screenWidth * 0.05,
      right: screenWidth * 0.05,
      top: screenHeight * .015,
      bottom: screenHeight * .015);
  EdgeInsets get innerpadding => EdgeInsets.only(
      left: screenWidth * 0.02,
      right: screenWidth * 0.02,
      top: screenHeight * .016,
      bottom: screenHeight * .016);
  EdgeInsets get smallinnerpadding => EdgeInsets.only(
      left: screenWidth * 0.02,
      right: screenWidth * 0.02,
      top: screenHeight * .005,
      bottom: screenHeight * .005);
  EdgeInsets get paddingHeighy02 => EdgeInsets.only(
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
      top: screenHeight * .012,
      bottom: screenHeight * .012);
  EdgeInsets get paddingHeighy01 => EdgeInsets.only(
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
      top: screenHeight * .008,
      bottom: screenHeight * .008);
  EdgeInsets get smalltpadding => EdgeInsets.only(
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
      top: screenHeight * .005,
      bottom: screenHeight * .007);

  EdgeInsets get smallerpadding => EdgeInsets.only(
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
      top: screenHeight * .0025,
      bottom: screenHeight * .0025);
  EdgeInsets get largePadding => EdgeInsets.only(
      left: screenWidth * 0.12,
      right: screenWidth * 0.12,
      top: screenHeight * .01,
      bottom: screenHeight * .01);
  EdgeInsets get mediumPadding => EdgeInsets.only(
      left: screenWidth * 0.037,
      right: screenWidth * 0.037,
      top: screenHeight * .016,
      bottom: screenHeight * .016);
  EdgeInsets get mediumCPadding => EdgeInsets.only(
      left: screenWidth * 0.037,
      right: screenWidth * 0.037,
      top: 10,
      bottom: 10);
  EdgeInsets get smallerPadding => EdgeInsets.only(
      left: screenWidth * 0.037,
      right: screenWidth * 0.037,
      top: screenHeight * .012,
      bottom: screenHeight * .012);
  EdgeInsets get cmediumPadding => EdgeInsets.only(
      left: screenWidth * 0.05, right: screenWidth * 0.05, top: 18, bottom: 18);
  EdgeInsets get verticalPadding =>
      EdgeInsets.only(bottom: screenHeight * 0.005, top: screenHeight * .0005);
  EdgeInsets get bottomPadding => EdgeInsets.only(
        bottom: screenHeight * 0.015,
      );
  EdgeInsets get bottomsmallPadding => EdgeInsets.only(
        bottom: screenHeight * 0.005,
      );
  EdgeInsets get verticalBigPadding =>
      EdgeInsets.only(bottom: screenHeight * 0.009, top: screenHeight * .009);
  static EdgeInsets get verticalLarPadding =>
      const EdgeInsets.only(bottom: 15, top: 15);
  static EdgeInsets get verticalC13Padding =>
      const EdgeInsets.only(bottom: 13, top: 13);
  static EdgeInsets get paddingC13 =>
      const EdgeInsets.only(left: 13, right: 13, bottom: 13, top: 13);
  EdgeInsets get verticalMediumPadding =>
      EdgeInsets.only(bottom: screenHeight * 0.004, top: screenHeight * .004);
  EdgeInsets get sidebottompadding => EdgeInsets.only(
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
      bottom: screenHeight * .015);
  EdgeInsets get bigPadding => EdgeInsets.only(
      left: screenWidth * 0.05,
      right: screenWidth * 0.05,
      top: screenHeight * .04,
      bottom: screenHeight * .04);
  EdgeInsets get csmallmediumPadding => EdgeInsets.only(
      left: screenWidth * 0.05, right: screenWidth * 0.05, top: 10, bottom: 10);
  static EdgeInsets get smallverticalPadding =>
      const EdgeInsets.only(top: 11, bottom: 11);
  static EdgeInsets get smallerverticalPadding =>
      const EdgeInsets.only(top: 5, bottom: 5);
  static EdgeInsets get smallerverticalPadding3 =>
      const EdgeInsets.only(top: 3, bottom: 3);
  EdgeInsets get bottomsidePadding => EdgeInsets.only(
      left: screenWidth * 0.043, right: screenWidth * 0.043, bottom: 50);

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  static Widget horizontalSpaceBig() {
    return horizontalSpace(HorizontalSpaceBig);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return SizedBox(width: width);
  }
}
