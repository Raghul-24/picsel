library utils;

import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';
import 'package:flutter_starter_project/src/utils/src/colors/common_colors.dart';
import 'package:image_picker/image_picker.dart';

export 'src/extensions/string_extentions.dart';
export 'src/colors/app_colors.dart';
export 'src/typedefs.dart';
export 'src/helpers/image_utils.dart';

class Utils {



  static String success = "success";
  static String isRegistered = "true";

  static double getScreenWidth(BuildContext context, double y) {
    return context.screenWidth * (y / 360.0);
  }

  static double getScreenHeight(BuildContext context, double y) {
    return context.screenHeight * (y / 752.0);
  }

  static double getWidth(double x, double y) {
    return x * (y / 360.0);
  }

  static double getHeight(double x, double y) {
    return x * (y / 752.0);
  }

  void myAlert(BuildContext context, {bool anotherImage = false,VoidCallback? gallery, VoidCallback? camera}) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(UIDimens.size20), topRight: Radius.circular(UIDimens.size20))),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              children: [
                Container(
                  height: UIDimens.size40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: CommonColor.primaryTitleColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(UIDimens.size20),
                          topRight: Radius.circular(UIDimens.size20))),
                  child: Center(
                      child: Text(
                        anotherImage
                            ? "Select Another Image to see the results"
                            : "Please choose media to select",
                        style: const TextStyle(color: Colors.white, fontSize: UIDimens.size15),
                      )),
                ),
                ListTile(
                  onTap:gallery,
                  leading: Icon(
                    Icons.image,
                    color: CommonColor.primaryTitleColor,
                  ),
                  title: const Text("Form Gallery"),
                ),
                ListTile(
                  onTap:camera,
                  leading: Icon(
                    Icons.camera,
                    color: CommonColor.primaryTitleColor,
                  ),
                  title: const Text("Form Camera"),
                ),
              ],
            ),
          );
        });
  }
}

extension SizeBoxExtension on double {
  Widget get widthBox => SizedBox(width: this);

  Widget get heightBox => SizedBox(height: this);
}

extension PaddingUtils on Widget {
  Padding paddingAll(
    double value,
  ) =>
      Padding(
        key: key,
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );

  Padding paddingLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Padding paddingSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );
}
