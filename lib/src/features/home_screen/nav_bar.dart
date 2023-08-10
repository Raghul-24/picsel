import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/constants/string_constants.dart';
import 'package:flutter_starter_project/src/ui_utils/text_styles.dart';
import 'package:flutter_starter_project/src/utils/src/colors/common_colors.dart';
import 'package:flutter_starter_project/src/utils/utils.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, this.onPressed, });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
            decoration: BoxDecoration(
                color:CommonColor.primaryLightColor,
               ),
            child:Text(
              StringConstants.appName.tr(context),
              style: TextStyles.blueTextStyle,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: onPressed,
          ),
        ],
      ),
    );
  }
}