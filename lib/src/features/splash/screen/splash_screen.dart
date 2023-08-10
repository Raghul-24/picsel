import 'package:flutter_starter_project/src/routing/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/services/local_storage/key_value_storage_service.dart';
import 'package:flutter_starter_project/src/utils/src/colors/common_colors.dart';
import 'package:flutter_starter_project/src/ui_utils/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../utils/utils.dart';
import '../../../constants/string_constants.dart';



class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  final KeyValueStorageService _keyValueStorageService =
  KeyValueStorageService();

  @override
  void initState() {
    _timer();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          color: CommonColor.primaryTitleColor,
          child: Center(child: Text(StringConstants.appName.tr(context),
            style: TextStyles.titleTextStyle.copyWith(fontSize: 50,color: Colors.white),))),
    );
  }
  
  void _timer(){
    Future.delayed(const Duration(seconds: 3),_nextPage);
  }

  Future<void> _nextPage() async {
    if(_keyValueStorageService.getAuthState()){
      Navigator.of(context).pushNamedAndRemoveUntil(RouteConstants.homeScreen,
              (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(RouteConstants.loginScreen,
              (route) => false);
    }

  }
  
}

