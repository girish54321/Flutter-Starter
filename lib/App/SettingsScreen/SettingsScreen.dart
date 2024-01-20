import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/FeedScreen.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/state/settingsState.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingController settingController =
      GetInstance().put<SettingController>(SettingController());

  final List<AppMenuItem> menu = [
    AppMenuItem(
        "setting",
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        )),
    AppMenuItem(
        "logout",
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
        ))
  ];

  Future<void> userLogout() async {
    final action =
        await Dialogs.yesAbortDialog(context, 'Log Out?', 'Are you sure?');
    if (action == DialogAction.yes) {
      final box = GetStorage();
      box.remove('token');
      Get.offAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (val) {
              if (val == "logout") {
                userLogout();
                return;
              }
            },
            itemBuilder: (BuildContext context) {
              return menu.map((AppMenuItem choice) {
                return PopupMenuItem<String>(
                    value: choice.id, child: choice.widget);
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
              title: const Text("Theme"),
              subtitle: const Text("Change app them"),
              trailing: Obx((() => Switch(
                    value: settingController.isDark.value,
                    onChanged: (bool _) => settingController.toggleThem(),
                  )))),
        ],
      ),
    );
  }
}
