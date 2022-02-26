import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/main.dart';
import 'app.dart';
import 'flavors.dart';

Future<void> main() async {
  await GetStorage.init();
  F.appFlavor = Flavor.REQRES;
  runApp(ReqResApp());
}
