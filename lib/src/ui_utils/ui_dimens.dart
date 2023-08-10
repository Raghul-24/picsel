import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class UIDimens {
  static const double zero = 0.0;

  //Sizes
  static const double sizePoint5 = 0.5;
  static const double size1 = 1.0;
  static const double size2 = 2.0;
  static const double size3 = 3.0;
  static const double size4 = 4.0;
  static const double size5 = 5.0;
  static const double size6 = 6.0;

  static const double size7 = 7.0;
  static const double size8 = 8.0;
  static const double size9 = 9.0;
  static const double size10 = 10.0;
  static const double size11 = 11.5;
  static const double size12 = 12.0;
  static const double size13 = 13.0;
  static const double size14 = 14.0;
  static const double size15 = 15.0;
  static const double size16 = 16.0;
  static const double size17 = 17.0;

  static const double size18 = 18.0;
  static const double size19 = 19.0;

  static const double size20 = 20.0;

  static const double size21 = 21.0;
  static const double size22 = 22.0;
  static const double size23 = 23.0;
  static const double size24 = 24.0;
  static const double size25 = 25.0;
  static const double size28 = 28.0;
  static const double size30 = 30.0;
  static const double size32 = 32.0;
  static const double size33 = 33.0;
  static const double size34 = 34.0;
  static const double size35 = 35.0;
  static const double size40 = 40.0;
  static const double size44 = 44.0;
  static const double size45 = 45.0;
  static const double size46 = 46.0;
  static const double size50 = 50.0;
  static const double size52 = 52.0;
  static const double size55 = 55.0;
  static const double size56 = 56.0;
  static const double size60 = 60.0;
  static const double size65 = 65.0;
  static const double size70 = 70.0;
  static const double size72 = 72.0;
  static const double size75 = 75.0;
  static const double size80 = 80.0;
  static const double size85 = 85.0;
  static const double size90 = 90.0;
  static const double size95 = 95.0;
  static const double size100 = 100.0;
  static const double size110 = 110.0;
  static const double size120 = 120.0;
  static const double size130 = 130.0;
  static const double size140 = 140.0;
  static const double size150 = 150.0;
  static const double size159 = 159.0;
  static const double size160 = 160.0;
  static const double size165 = 165.0;
  static const double size170 = 170.0;
  static const double size180 = 180.0;
  static const double size185 = 185.0;
  static const double size176 = 176.0;
  static const double size190 = 190.0;
  static const double size200 = 200.0;
  static const double size220 = 220.0;
  static const double size235 = 235.0;
  static const double size250 = 250.0;
  static const double size255 = 255.0;
  static const double size260 = 260.0;
  static const double size275 = 275.0;
  static const double size295 = 295.0;
  static const double size300 = 300.0;
  static const double size310 = 310.0;
  static const double size320 = 320.0;
  static const double size360 = 360.0;
  static const double size370 = 370.0;
  static const double size400 = 400.0;
  static const double size430 = 430.0;
  static const double size440 = 440.0;
  static const double size500 = 500.0;
  static const double size600 = 600.0;
  static const double size700 = 700.0;

  //image scale
  static const double scale = 4.0;
  static const double scale18 = 18.0;

  //Margin
  static const double margin5 = 5.0;
  static const double margin10 = 10.0;
  static const double margin15 = 15.0;
  static const double margin20 = 20.0;
  static const double margin30 = 30.0;
  static const double margin40 = 40.0;
  static const double margin70 = 70.0;
  static const double margin100 = 100.0;

  //Padding
  static const paddingXXXSmall = 2.0;
  static const paddingXXSmall = 4.0;
  static const paddingXSmall = 7.0;
  static const paddingXYSmall = 8.0;
  static const paddingYSmall = 10.0;
  static const paddingSmall = 14.0;
  static const paddingMedium = 15.0;
  static const paddingXMedium = 20.0;
  static const paddingLarge = 24.0;

  static const double imageWidth = 270;
  static const double imageHeight = 120;

  static const double cardRadius = 8.0;

  static const double carouselDotSize = 7.0;
  static const double carouselIndicatorPadding = 8.0;
  static const double carouselIndicatorHeight = 20.0;
  static const double chartHeight = 300.0;

  static const double borderXSmall = 3.0;

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;

  static const double borderRadius = 6.0;
  static const double borderRadius5 = 5.0;
  static const double mapZoom = 16.0;
}

extension ContextUtils on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension Log on Object {
  void log() => devtools.log(toString());
}