// ignore_for_file: constant_identifier_names

import 'package:momentmaster/domain/entities/bubble.dart';

import 'app_colors.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static Widget sizer(double h, double w, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * w,
      height: MediaQuery.of(context).size.height * h,
    );
  }

//font size
  static const double fontSizeVeryLarge = 40;
  static const double fontSizeMedium = 20;
  static const double fontSizeSmall = 16;
  static const double fontSizeLarge = 24;

  static Bubble getBubble(String text, VoidCallback onPressed, IconData icon) {
    return Bubble(
      title: text,
      iconColor: AppColors.primaryBlue,
      bubbleColor: Colors.white,
      icon: icon,
      titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
      onPress: onPressed,
    );
  }

//radius
  static const double introGetStarted_button_Radius = 20.0;
  static const double backArrowContainreRightRadius = 25;
  static const double RadiusMedium = 20;
  static const double ContainerRoundCorner_Radius = 10;

  static const double ContainerMediumRoundCorner_Radius = 20;
  static const double button_Radius = 15.0;
  static const double appBar_Radius = 40;
  static const double radius = 3;
  static const double radiusSmall = 6;

//icon size
  static const double signUpDropDown_IconSize = 24;
  static const double mainTab_IconSize = 28;
  static const double iconHeightWidth = 350;
  static const double smallIconheight = 13;

  //signin page
  static const double RoundViewButtonRadius = 30;
  static const double EmailPasswordWidgetRadius = 20;

  //signup page
  static const double backArrowContainreHeight = 50;
  static const double backArrowContainreWidth = 60;
  static const double backArrowContainrheight = 70;

  static const double RoundSignupButton_ContainerHeight = 60;
  static const double ShadowBox_SpreadRadius = 5;
  static const double ShadowBox_BlurRadius = 10;
  static const double ShadowBox_WithOpacity = 0.1;
  static const double ShadowBox_Offset = 3;

  //DecideUserType Screen item widget
  static const double Image_height = 100;
  static const double Card_Height = 240;

  //margin -padding
  static const double Card_margin = 10;
  static const double TextField_Contentpading = 10.0;
  static const double TextField_Contentpading_top = 10.0;
  static const double marginMedium = 30.0;
  static const double marginsmall = 10.0;
  static const double marginSmallLarge = 12.0;
  static const double marginLarge = 80;
  static const double marginVerySmall = 2;
  static const double marginVerySmall1 = 5;
  static const double marginVeryVerySmall = 1;
  static const double margin15 = 15;

  //height-width
  static const double imageHeight_width_Very_small = 15;
  static const double imageHeight_width_small = 20;
  static const double imageHeight_width = 25;
  static const double ContainerHeight_width = 30;
  static const double ContainerHeight_widthLarge = 100;
  static const double ContainerHeight_widthLargeSmall = 100;
  static const double ContainerHeight_widthVeryLarg = 170;
  static const double ContainerHeight_widthVeryLarg1 = 130;
  static const double ContsinerHeight_WidthC140 = 140;
  static const double ContainerHeight_widthMedium = 55;
  static const double ContainerHeight_widthMediumlarge = 85;

  //signup round button
  static const double ShadowBox_SpreadRadius_medium = 7;
  static const double ShadowBox_BlurRadius_Medium = 7;
  static const double ShadowBox_WithOpacityMedium = 0.2;

  //listview
  static const double List_itemExtent = 360;

  //rattingbar
  static const int RatingBar_opacity = 50;
  static const int Ratingbar_item_count = 5;
  static const double Ratingbar_itemSize = 13.0;

  //dash line
  static const double dash_width = 7;
  static const double empty_width = 6;

  static Widget circulerProgressIndicator() {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColors.primaryBlue,
        ),
      ),
    );
  }
}
