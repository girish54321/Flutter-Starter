import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/MainTab/MainTab.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/flavors.dart';
import 'package:reqres_app/state/settingsState.dart';
// For rootBundle

class ReqResApp extends StatelessWidget {
  final ThemeData darkThem;
  final ThemeData lightThem;
  const ReqResApp({Key? key, required this.darkThem, required this.lightThem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    GetInstance().put<SettingController>(SettingController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
            name: '/',
            page: () {
              return box.hasData(JWT_KEY)
                  ? _wrapWithBanner(const MainTab())
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
