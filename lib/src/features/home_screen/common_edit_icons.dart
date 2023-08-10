import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';

class CommonEditIcons extends StatelessWidget {
  const CommonEditIcons({super.key, this.onPressed, this.image});
  final VoidCallback? onPressed;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  SizedBox(
        height: UIDimens.size50,
        child: Image(
          image: AssetImage(image!),
        ),
      ),
    );
  }
}
