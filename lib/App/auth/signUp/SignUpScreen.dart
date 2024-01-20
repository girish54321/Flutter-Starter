import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/FeedScreen.dart';
import 'package:reqres_app/App/auth/signUp/SignUpUI.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/dismissKeyBoardView.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    print(value);
    setState(() {
      rememberMe = value;
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
          if (rememberMe) {
            GetStorage box = GetStorage();
            var res = value.value as LoginSuccess;
            box.write('token', res.user?.token);
          }
          Get.offAll(FeedScreen());
        }
      });
    } else {
      // Helper().vibratPhone();
    }
  }

  void createAccount() {
    // Helper().dismissKeyBoard(context);
    // Helper().goToPage(context, SignUpScreen());
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
      child: SignUpScreenUI(
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
