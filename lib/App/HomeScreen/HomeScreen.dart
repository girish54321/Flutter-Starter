import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenUI.dart';
import 'package:reqres_app/App/SettingsScreen/SettingsScreen.dart';
import 'package:reqres_app/App/UserInfoScreen/userinfoScreenUI.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/state/userListState.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class AppMenuItem {
  final String id;
  final Widget widget;
  AppMenuItem(this.id, this.widget);
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RemoteDataSource _apiResponse = RemoteDataSource();
  final ProductController controller = Get.put(ProductController());
  final List<AppMenuItem> menu = [];

  Future<void> userLogout() async {
    final action =
        await Dialogs.yesAbortDialog(context, 'Log Out?', 'Are you sure?');
    if (action == DialogAction.yes) {
      final box = GetStorage();
      box.remove('token');
      Get.offAll(LoginScreen());
    }
  }

  void goToUserInfoScreen(UserListResponseData userListResponseData) {
    controller.selectUser(userListResponseData);
    Helper().goToPage(context: context, child: const UserInfoScreen());
  }

  void goToSettings() {
    Helper().goToPage(context: context, child: SettingsScreen());
  }

  @override
  void initState() {
    super.initState();
    Future<Result> result = _apiResponse.userList();
    result.then((value) {
      if (value is SuccessState) {
        var res = value.value as UserListResponse;
        controller.saveResponseInState(res);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreenUI(
        userLogout: userLogout,
        remoteDataSource: _apiResponse,
        menu: menu,
        goToSettings: goToSettings,
        goToUserInfoScreen: goToUserInfoScreen);
  }
}
