import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';
import 'package:flutter_starter_project/src/utils/utils.dart';

class WidthSpaceBox extends StatefulWidget {
  const WidthSpaceBox({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  State<WidthSpaceBox> createState() => _WidthSpaceBoxState();
}

class _WidthSpaceBoxState extends State<WidthSpaceBox> {
  @override
  Widget build(BuildContext context) {
    return Utils.getWidth(context.screenWidth, widget.size).widthBox;
  }
}

class HeightSpaceBox extends StatefulWidget {
  const HeightSpaceBox({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;
  @override
  State<HeightSpaceBox> createState() => _HeightSpaceBoxState();
}

class _HeightSpaceBoxState extends State<HeightSpaceBox> {
  @override
  Widget build(BuildContext context) {
    return Utils.getHeight(context.screenHeight, widget.size).heightBox;
  }
}
