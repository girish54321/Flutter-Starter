import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenUI.dart';
import 'package:reqres_app/App/UserInfoScreen/userinfoScreenUI.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RemoteDataSource _apiResponse = RemoteDataSource();

  Future<void> userLogout() async {
    final action =
        await Dialogs.yesAbortDialog(context, 'Log Out?', 'Are you sure?');
    if (action == DialogAction.yes) {
      final box = GetStorage();
      box.remove('token');
      Get.offAll(LoginScreen());
    }
  }

  void goToUserInfoScreen() {
    Helper().goToPage(context: context, child: UserInfoScreen());
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreenUI(
        userLogout: userLogout,
        remoteDataSource: _apiResponse,
        goToUserInfoScreen: goToUserInfoScreen);
  }
}
