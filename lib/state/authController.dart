import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';

class AuthController extends GetxController {
  RxBool isDark = false.obs;
  GetStorage box = GetStorage();
  Rx<LoginSuccessUser> userData = LoginSuccessUser().obs;

  @override
  void onReady() {
    super.onReady();
    loadUserData();
    loadThem();
  }

  void setUserData(LoginSuccessUser loginSuccess) {
    userData.value = loginSuccess;
  }

  void loadUserData() {
    if (box.hasData(USER_DATA)) {
      var data = box.read(USER_DATA);
      print(data);
      userData.value = LoginSuccessUser.fromJson(json.decode(data));
      print("userData.value.user.username;");
      print(userData.value.email);
    }
  }

  void loadThem() {
    if (box.hasData('darkThem')) {
      var isSavedDark = box.read('darkThem');
      if (isSavedDark) {
        isDark.value = true;
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        isDark.value = false;
        Get.changeThemeMode(ThemeMode.light);
      }
    } else {
      isDark.value = false;
      Get.changeThemeMode(ThemeMode.light);
    }
  }

  void saveThemSetting(bool value) {
    box.write("darkThem", value);
  }

  void toggleThem() {
    isDark.value = !isDark.value;
    if (isDark.value == true) {
      saveThemSetting(true);
      // Get.changeTheme(_darkTheme);
      Get.changeThemeMode(ThemeMode.dark);
    } else if (isDark.value == false) {
      saveThemSetting(false);
      // Get.changeTheme(_lightTheme);
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
