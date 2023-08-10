import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/common_widgets/src/buttons/outline_button.dart';
import 'package:flutter_starter_project/src/common_widgets/src/text_field/common_text_field.dart';
import 'package:flutter_starter_project/src/constants/string_constants.dart';
import 'package:flutter_starter_project/src/controllers/sign_in_controller.dart';
import 'package:flutter_starter_project/src/features/sign_up_screen/sign_up_controller.dart';
import 'package:flutter_starter_project/src/routing/route_constants.dart';
import 'package:flutter_starter_project/src/ui_utils/app_snack_bar.dart';
import 'package:flutter_starter_project/src/ui_utils/ui_dimens.dart';
import 'package:flutter_starter_project/src/utils/src/colors/common_colors.dart';
import 'package:flutter_starter_project/src/ui_utils/sized_box.dart';
import 'package:flutter_starter_project/src/ui_utils/text_styles.dart';
import 'package:flutter_starter_project/src/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {

    _signInController = SignInController();
    _signInController.init(context);
    _signInController.addListener(() {
      setState(() {});
    });

    _signUpController = SignUpController();
    _signUpController.init(context);
    _signUpController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _signInController.dispose();
    _signUpController.dispose();
    super.dispose();
  }

  bool isLogin = false;
  bool isSignUp = false;

  late SignInController _signInController;
  late SignUpController _signUpController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.backgroundGrey,
      body: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Utils.getScreenWidth(context, 18),
                  vertical: Utils.getScreenWidth(context, UIDimens.size15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(StringConstants.appName.tr(context),style: TextStyles.titleTextStyle),
                            const HeightSpaceBox(size: UIDimens.size30),
                            CommonTextField(
                                controller:isSignUp? _signUpController.emailController:_signInController.emailController,
                                hintText:
                                StringConstants.enterYourEmail.tr(context)),
                            CommonTextField(
                              controller:isSignUp?_signUpController.passwordController: _signInController.passwordController,
                              hintText:
                              StringConstants.enterYourPassword.tr(context),
                            ),
                            const SizedBox(height: UIDimens.size25),
                            CommonOutlineButton(
                              text: isSignUp
                                  ? "Register"
                                  : StringConstants.signIn.tr(context),
                              textStyle: TextStyles.whiteTextStyle,
                              backgroundColor: CommonColor.primaryLightColor,
                              onPressed: () async {
                                if(!isSignUp) {
                                  bool valid = await _signInController.login();
                                if(valid){
                                  Navigator.pushNamed(context, RouteConstants.homeScreen);
                                } else {
                                  AppSnackBar(message: _signInController.errorModel?.error?.message
                                  ).showAppSnackBar(context);
                                  }
                                } else {
                                  bool valid = await _signUpController.signUp();
                                  if(valid){
                                    Navigator.pushNamed(context, RouteConstants.loginScreen);
                                  } else {
                                    AppSnackBar(message: _signUpController.errorModel?.error?.message
                                    ).showAppSnackBar(context);
                                  }
                                }
                              },
                            ),
                            const HeightSpaceBox(size:UIDimens.size170),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${!isSignUp?StringConstants.notAMember.tr(context):"Already Registered"}?",style: TextStyles.greyTextStyle),
                                const SizedBox(width: UIDimens.size5),
                                GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isSignUp = !isSignUp;
                                      });
                                    },
                                    child: Text(!isSignUp?StringConstants.register.tr(context):"SignIn",style: TextStyles.blueTextStyle.copyWith(color: CommonColor.primaryTitleColor))),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  // if(!focusNode!.hasFocus)
                ],
              ),
            ),
          )
    );
  }
}
