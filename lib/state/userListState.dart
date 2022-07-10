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
      print("on load");
      print(box.read('darkThem'));
      if (box.read('darkThem')) {
        isDark.value = true;
        changeMode();
      } else {
        isDark.value = false;
        changeMode();
      }
    } else {
      isDark.value = false;
      changeMode();
    }
  }

  void saveThemSetting(bool value) {
    box.write("darkThem", value);
  }

  ThemeData _darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  ThemeData _lightTheme = ThemeData(
    fontFamily: "customFont",
    primaryColor: Color(0xff20b36e),
    buttonColor: Color(0xff20b36e),
    accentColor: Color(0xff20b36e),
    primarySwatch: MaterialColor(
      4280333166,
      <int, Color>{
        50: Color.fromRGBO(
          32,
          179,
          110,
          .1,
        ),
        100: Color.fromRGBO(
          32,
          179,
          110,
          .2,
        ),
        200: Color.fromRGBO(
          32,
          179,
          110,
          .3,
        ),
        300: Color.fromRGBO(
          32,
          179,
          110,
          .4,
        ),
        400: Color.fromRGBO(
          32,
          179,
          110,
          .5,
        ),
        500: Color.fromRGBO(
          32,
          179,
          110,
          .6,
        ),
        600: Color.fromRGBO(
          32,
          179,
          110,
          .7,
        ),
        700: Color.fromRGBO(
          32,
          179,
          110,
          .8,
        ),
        800: Color.fromRGBO(
          32,
          179,
          110,
          .9,
        ),
        900: Color.fromRGBO(
          32,
          179,
          110,
          1,
        ),
      },
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xff20b36e),
        ),
      ),
    ),
  );

  void changeMode() {
    isDark.value = !isDark.value;
    if (isDark.value) {
      saveThemSetting(false);
      // Get.changeTheme(_darkTheme);
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      saveThemSetting(true);
      // Get.changeTheme(_lightTheme);
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
