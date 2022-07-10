import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:reqres_app/state/userListState.dart';
import 'dart:io' show Platform;

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingController settingController =
      GetInstance().put<SettingController>(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          ListTile(
              title: const Text("Theme"),
              subtitle: const Text("Change app them"),
              trailing: Obx((() => Switch(
                    value: settingController.isDark.value,
                    onChanged: (bool _) => settingController.changeMode(),
                  )))),
          Switch(value: true, onChanged: (bool _) => print("fa"))
          // Obx(
          //   () => CupertinoSwitch(
          //     onChanged: (bool _) => settingController.changeMode(),
          //     value: settingController.isDark.value,
          //   ),
          // ),
        ],
      ),
    );
  }
}
