import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/MainTab/MainTab.dart';
import 'package:reqres_app/App/auth/login/loginUI.dart';
import 'package:reqres_app/App/auth/signUp/SignUpScreen.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/state/authController.dart';
import 'package:reqres_app/widget/dismissKeyBoardView.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthController authController =
      GetInstance().put<AuthController>(AuthController());

  bool validEmail = false, validPassword = false, rememberMe = true;

  void goBack(context) {
    Helper().goBack();
  }

  void changeVaildEmail(bool value) {
    setState(() {
      validEmail = value;
    });
  }

  void changevalidPassword(bool value) {
    setState(() {
      validPassword = value;
    });
  }

  void changeRemember(bool value) {
    setState(() {
      rememberMe = value;
    });
  }

  void loginUser() {
    if (_formKey.currentState!.validate()) {
      Helper().dismissKeyBoard(context);
      Helper().showLoading();
      RemoteDataSource _apiResponse = RemoteDataSource();
      var parameter = {
        "user": {"email": "girish54321@gmail.com", "password": "Girish@54321"}
      };
      Future<Result> result = _apiResponse.userLogin(parameter);
      result.then((value) {
        if (value is SuccessState) {
          Helper().hideLoading();
          if (rememberMe) {
            GetStorage box = GetStorage();
            var res = value.value as LoginSuccess;
            authController.setUserData(res.user!);
            box.write(JWT_KEY, res.user?.token);
            box.write(USER_DATA, json.encode(res.user));
          }
          Get.off(const MainTab());
        } else {}
      });
    } else {
      Helper().hideLoading();
    }
  }

  void createAccount() {
    Helper().dismissKeyBoard(context);
    Helper().goToPage(context: context, child: SignUpScreen());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoardView(
      child: LoginScreenUI(
          emailController: emailController,
          passwordController: passwordController,
          validEmail: validEmail,
          validPassword: validPassword,
          changeVaildEmail: changeVaildEmail,
          changevalidPassword: changevalidPassword,
          changeRemember: changeRemember,
          rememberMe: rememberMe,
          formKey: _formKey,
          createAccount: createAccount,
          loginUser: loginUser),
    );
  }
}
