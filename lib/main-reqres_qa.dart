import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:json_theme/json_theme.dart';
import 'package:reqres_app/main.dart';
import 'app.dart';
import 'flavors.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  await GetStorage.init();
  F.appFlavor = Flavor.REQRES_QA;
  runApp(ReqResApp(
    darkThem: darkTheme,
    lightThem: lightThem,
  ));
}
