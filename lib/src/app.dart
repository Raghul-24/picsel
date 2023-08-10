import 'package:flutter_starter_project/src/services/connectivity_service_provider.dart/connectivity_service_provider.dart';
import 'package:flutter_starter_project/src/ui_utils/app_snack_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../src/localization/app_locallization.dart';
import 'package:flutter/material.dart';
import 'localization/languages.dart';
import 'routing/routes.dart' as routes;
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulHookConsumerWidget{
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
      localizationsDelegates: const [
        //Custom App delegates
        AppLocalizations.delegate,
        // material delegates
        GlobalMaterialLocalizations.delegate,
        // Any type of Widget in Locale
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      builder: (_, child,) =>
          NetWorkCheck(child: child ?? const SizedBox()),
      onGenerateRoute: routes.onGenerateRoute,
    );
  }
}

class NetWorkCheck extends HookConsumerWidget {
  const NetWorkCheck({ required this.child,super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<ConnectionStatus>>(
      connectionStreamProvider,
      (prevState, newState) {
        newState.whenOrNull(
          data: (status) {
            String message = status == ConnectionStatus.disconnected
                ? 'Your Disconnected'
                : 'Your Back Online';
         return  AppSnackBar(isPositive: true, message: message)
                .showAppSnackBar(context);
          },
        );
      },
    );
    return  GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
