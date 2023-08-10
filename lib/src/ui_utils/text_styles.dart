import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/utils/src/colors/common_colors.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';

import 'fonts.dart';

class TextStyles{
  static  TextStyle titleTextStyle = TextStyle(
      fontSize: UIDimens.size40,
      color: CommonColor.primaryTitleColor,
      fontFamily: Fonts.titleRegular,
      fontWeight: FontWeight.w700);
  static  TextStyle greyTextStyle = TextStyle(
      fontSize: UIDimens.size15,
      color: CommonColor.darkTextGrey,
      // fontFamily: Fonts.bold,
      fontWeight: FontWeight.w700);
  static  TextStyle whiteTextStyle = TextStyle(
      fontSize: UIDimens.size13,
      color: CommonColor.whiteColor,
      // fontFamily: Fonts.regular
  );
  static  TextStyle blueTextStyle = TextStyle(
      fontSize: UIDimens.size16,
      color: CommonColor.primaryTitleColor,
      fontWeight: FontWeight.w700);
}