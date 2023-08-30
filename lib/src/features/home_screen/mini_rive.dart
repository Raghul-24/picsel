
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_project/src/common_widgets/src/buttons/outline_button.dart';
import 'package:flutter_starter_project/src/constants/string_constants.dart';
import 'package:flutter_starter_project/src/features/home_screen/nav_bar.dart';
import 'package:flutter_starter_project/src/routing/route_constants.dart';
import 'package:flutter_starter_project/src/ui_utils/text_styles.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';
import 'package:flutter_starter_project/src/utils/src/colors/common_colors.dart';
import 'package:flutter_starter_project/src/utils/src/extensions/string_extentions.dart';
import 'package:rive/rive.dart';

import '../../controllers/home_controller.dart';

class RiveScreen extends StatefulWidget {
  const RiveScreen({super.key});

  @override
  State<RiveScreen> createState() => _RiveState();
}

class _RiveState extends State<RiveScreen> {
  late String animationURL;
  Artboard? _teddyArtboard;
  SMINumber? numValue;
  StateMachineController? stateMachineController;

  @override
  void initState() {
            super.initState();
            animationURL = defaultTargetPlatform == TargetPlatform.android ||
                defaultTargetPlatform == TargetPlatform.iOS
                ? 'assets/animations/mixing.riv'
                : 'animations/mixing.riv';
            rootBundle.load(animationURL).then(
                  (data) {
                final file = RiveFile.import(data);
                final artboard = file.mainArtboard;
                stateMachineController =
                    StateMachineController.fromArtboard(artboard,"State Machine 1");
                if (stateMachineController != null) {
                  artboard.addController(stateMachineController!);

                  stateMachineController!.inputs.forEach((e) {
                    debugPrint(e.runtimeType.toString());
                    debugPrint("name${e.name}End");
                  });

                  stateMachineController!.inputs.forEach((element) {
            print(element.name);
            if (element.name == "beginner") {
              numValue = element as SMINumber;
            } else if (element.name == "level") {
              numValue = element as SMINumber;

            }else if(element.name =="expert"){
              numValue = element as SMINumber;
            }
          });
        }

        setState(() => _teddyArtboard = artboard);
      },
    );
  }

  double _currentSliderValue = 50;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.logoCommonLightColor,
      drawer: NavDrawer(
        onPressed: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteConstants.loginScreen, (route) => false);
        },
      ),
      appBar: AppBar(
        backgroundColor: CommonColor.primaryLightColor,
        title: Text(StringConstants.appName.tr(context),style: TextStyles.titleTextStyle.copyWith(
            color: CommonColor.whiteColor,
            fontSize: UIDimens.size32
        ),),
      ),
      body: Center(
        child: Column(
          children: [
            if (_teddyArtboard != null)
              SizedBox(
                width: 400,
                height: 500,
                child: Rive(
                  artboard: _teddyArtboard!,
                  fit: BoxFit.fitWidth,
                ),
              ),
        Slider(
       value: _currentSliderValue,
       max: 100,
  divisions: 5,
  label: _currentSliderValue.round().toString(),
  onChanged: (double value) {
                if(value <= 30){
           numValue?.change(0);

         }else if(value <=70)
           {
             numValue?.change(1);

           }else{
           numValue?.change(2);
         }
  setState(() {
  _currentSliderValue = value;
  });
  },
  ),
            CommonOutlineButton(
              backgroundColor: CommonColor.primaryTitleColor,
              text: "Back to Home",
              width: MediaQuery.of(context).size.width / 1.4,
              onPressed: ()  {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

