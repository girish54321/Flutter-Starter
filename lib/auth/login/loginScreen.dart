import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreen.dart';
import 'package:reqres_app/auth/login/loginUI.dart';
import 'package:reqres_app/auth/signUp/SignUpScreen.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/dismissKeyBoardView.dart';

import '../../widget/DialogHelper.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validEmail = false, validPassword = false, remamberme = true;

  void goBack(context) {
    // Helper().goBack(context);
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

  void changeRemamberme(bool value) {
    setState(() {
      remamberme = value;
    });
  }

  void loginUser() {
    if (_formKey.currentState!.validate()) {
      Helper().dismissKeyBoard(context);
      Helper().showLoading();
      RemoteDataSource _apiResponse = RemoteDataSource();
      var parameter = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
      Future<Result> result = _apiResponse.userLogin(parameter);
      result.then((value) {
        if (value is SuccessState) {
          Helper().hideLoading();
          var res = value.value as LoginSuccess;
          Get.off(HomeScreen());
        }
      });
    } else {
      // Helper().vibratPhone();
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
          changeRemamberme: changeRemamberme,
          remamberme: remamberme,
          formKey: _formKey,
          createAccount: createAccount,
          loginUser: loginUser),
    );
  }
}
