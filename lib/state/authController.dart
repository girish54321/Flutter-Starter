import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/usermodal.dart';
import 'package:reqres_app/network/user_data_source.dart';

class AuthController extends GetxController {
  GetStorage box = GetStorage();
  Rx<LoginSuccessUser> userData = LoginSuccessUser().obs;
  Rx<UserModal> profileData = UserModal().obs;

  Rx<bool> bookMarkLoading = true.obs;

  final UserDataSource _apiResponse = UserDataSource();

  @override
  void onReady() {
    super.onReady();
    loadUserData();
  }

  void setUserData(LoginSuccessUser loginSuccess) {
    userData.value = loginSuccess;
  }

  void loadUserData() {
    if (box.hasData(USER_DATA)) {
      var data = box.read(USER_DATA);
      userData.value = LoginSuccessUser.fromJson(json.decode(data));
    }
  }

  void upDateUserData() {
    bookMarkLoading.value = true;
    Future<Result> result =
        _apiResponse.getUserProfile(userData.value.username ?? "");
    result.then((value) {
      bookMarkLoading.value = false;
      if (value is SuccessState) {
        var res = value.value as UserModal;
        profileData.value = res;
      } else {}
    });
  }
}
