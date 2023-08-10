import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/ui_utils/text_styles.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';

class CommonOutlineButton extends StatelessWidget {
  const CommonOutlineButton({super.key, this.onPressed, this.text, this.backgroundColor, this.textStyle, this.width, this.height});

  final VoidCallback? onPressed;
  final String? text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ?? MediaQuery.of(context).size.width / 1.1,
      height: height ?? UIDimens.size30,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Text(text!,style:textStyle ?? TextStyles.whiteTextStyle),
      ),
    );
  }
}
