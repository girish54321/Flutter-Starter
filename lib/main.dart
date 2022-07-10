import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/flavors.dart';
import 'package:reqres_app/state/userListState.dart';

ThemeData _darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,
      disabledColor: Colors.red,
    ));

class ReqResApp extends StatelessWidget {
  const ReqResApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  //CMD
  // flutter run --flavor reqres_dev -t lib/main-reqres_dev.dart

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    final SettingController settingController =
        GetInstance().put<SettingController>(SettingController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      // themeMode: ThemeMode.system,
      // theme: ThemeData(scaffoldBackgroundColor: Colors.red),
      // theme: ThemeData(primarySwatch: Colors.red),
      // darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
      theme: _lightTheme,
      darkTheme: _darkTheme,
      // themeMode: ThemeMode.system,
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
