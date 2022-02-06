import 'package:flutter/material.dart';
import 'package:reqres_app/auth/login/loginScreen.dart';
import 'package:get/get.dart';
import 'package:reqres_app/auth/signUp/signUpScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
      // home: SignUpScreen(),
    );
  }
}
