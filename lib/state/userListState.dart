import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/network/model/userListModal.dart';

class ProductController extends GetxController {
  // your state variables
  var counter = 244.obs;
  Rx<UserListResponseData> userListResponseData = UserListResponseData().obs;

  // your methods
  void selectUser(UserListResponseData item) {
    userListResponseData.value = item;
    update();
  }

  @override
  void onInit() {
    // Here you can fetch you product from server
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Here, you can dispose your StreamControllers
    // you can cancel timers
    super.onClose();
  }
}

class SettingController extends GetxController {
  RxBool isDark = false.obs;
  GetStorage box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    loadThem();
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

  // void loadThem() {
  //   if (box.hasData('darkThem')) {
  //     print("on load");
  //     print(box.read('darkThem'));
  //     if (box.read('darkThem')) {
  //       isDark.value = true;
  //       // changeMode();
  //       Get.changeThemeMode(ThemeMode.dark);
  //     } else {
  //       isDark.value = false;
  //       // changeMode();
  //       Get.changeThemeMode(ThemeMode.light);
  //     }
  //   } else {
  //     isDark.value = false;
  //     // changeMode();
  //     Get.changeThemeMode(ThemeMode.light);
  //   }
  // }

  // void saveThemSetting(bool value) {
  //   box.write("darkThem", value);
  // }

  // void changeMode() {
  //   isDark.value = !isDark.value;
  //   if (isDark.value) {
  //     saveThemSetting(false);
  //     // Get.changeTheme(_darkTheme);
  //     Get.changeThemeMode(ThemeMode.dark);
  //   } else {
  //     saveThemSetting(true);
  //     // Get.changeTheme(_lightTheme);
  //     Get.changeThemeMode(ThemeMode.light);
  //   }
  // }

}
