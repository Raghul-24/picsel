import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';
import 'package:flutter_starter_project/src/utils/src/colors/common_colors.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.hintText,
    required this.controller,
  });

  final String? hintText;
  final TextEditingController? controller;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: UIDimens.size5),
      child: SizedBox(
        height: UIDimens.size50,
        child: TextFormField(
          controller: widget.controller,
          style: TextStyle(color: Colors.grey.shade500),
          decoration: InputDecoration(
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(UIDimens.size10),
                  borderSide: BorderSide(color: CommonColor.backgroundGrey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(UIDimens.size10),
                  borderSide: BorderSide(color: CommonColor.logoCommonDarkColor)),
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500,)),
        ),
      ),
    );
  }
}
