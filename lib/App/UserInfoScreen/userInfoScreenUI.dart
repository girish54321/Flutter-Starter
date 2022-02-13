import 'package:flutter/material.dart';
import 'package:reqres_app/App/UserInfoScreen/userInfoScreen.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
//  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return UserInfoScreenUI();
  }
}
