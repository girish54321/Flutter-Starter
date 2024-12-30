import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/flavors.dart';
import 'package:reqres_app/state/settingsState.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// For rootBundle

class ReqResApp extends StatelessWidget {
  const ReqResApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    GetInstance().put<SettingController>(SettingController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      darkTheme: ThemeData(brightness: Brightness.dark),
      getPages: [
        GetPage(
            name: '/',
            page: () {
              return box.hasData('token')
                  ? _wrapWithBanner(HomeScreen())
                  : _wrapWithBanner(LoginScreen());
            })
      ],
    );
  }

  /// Adds banner to the [child] widget.
  Widget _wrapWithBanner(Widget child) {
    return Banner(
      child: child,
      location: BannerLocation.topStart,
      message: F.name,
      color: Colors.green.withOpacity(0.6),
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
      textDirection: TextDirection.ltr,
    );
  }
}
