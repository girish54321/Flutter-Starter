import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:json_theme/json_theme.dart';
import 'package:reqres_app/main.dart';
import 'app.dart';
import 'flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  //* Light Theme
  final lightThemString =
      await rootBundle.loadString('assets/them/lightThemData.json');
  final lightThemeJson = jsonDecode(lightThemString);
  final lightThem = ThemeDecoder.decodeThemeData(lightThemeJson)!;

  //* Dark Light Theme
  final darkThemString =
      await rootBundle.loadString('assets/them/darkThemData.json');
  final darkThemeJson = jsonDecode(darkThemString);
  final darkTheme = ThemeDecoder.decodeThemeData(darkThemeJson)!;

  F.appFlavor = Flavor.REQRES;
  runApp(ReqResApp(
    darkThem: darkTheme,
    lightThem: lightThem,
  ));
}
