import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/state/settingsState.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingController settingController =
      GetInstance().put<SettingController>(SettingController());

  void onLangChange(LocaleWidgetPair i) {
    settingController.changeLang(i);
  }

  @override
  Widget build(BuildContext context) {
    var localData = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localData.settingsscreen),
      ),
      body: Column(
        children: [
          ListTile(
              title: Text(localData.them),
              subtitle: Text(localData.changeappthem),
              trailing: Obx((() => Switch(
                    value: settingController.isDark.value,
                    onChanged: (bool _) => settingController.toggleThem(),
                  )))),
          ...settingController.mixedList.map((e) {
            return ListTile(
                onTap: () {
                  onLangChange(e);
                },
                leading:
                    settingController.selectedLocal.value.locale == e.locale
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const Icon(Icons.language),
                title: e.widget);
          })
        ],
      ),
    );
  }
}
