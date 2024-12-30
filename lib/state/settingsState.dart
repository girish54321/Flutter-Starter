import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleWidgetPair {
  Locale locale;
  Widget widget;

  LocaleWidgetPair(this.locale, this.widget);
}

class SettingController extends GetxController {
  RxBool isDark = false.obs;
  GetStorage box = GetStorage();
  Rx<LocaleWidgetPair> selectedLocal =
      LocaleWidgetPair(const Locale('hi'), const Text('English')).obs;
  List<LocaleWidgetPair> mixedList = [
    LocaleWidgetPair(const Locale('en'), const Text('English')),
    LocaleWidgetPair(const Locale('hi'), const Text('Hindi')),
  ];

  @override
  void onReady() {
    super.onReady();
    loadThem();
    defaultLocal();
  }

  //* Local Settings
  void changeLang(LocaleWidgetPair item) {
    Get.updateLocale(item.locale);
    selectedLocal.value = item;
    box.write('local', item.locale.toString());
  }

  void defaultLocal() {
    if (box.hasData('local')) {
      Get.updateLocale(Locale(box.read('local')));
      selectedLocal.value.locale = Locale(box.read('local'));
    } else {
      Get.updateLocale(const Locale('en'));
      box.write('local', 'en');
      selectedLocal.value.locale = const Locale('en');
    }
  }
  //* Local Settings

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
