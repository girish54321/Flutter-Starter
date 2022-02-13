import 'package:flutter/material.dart';

class UserInfoScreenUI extends StatelessWidget {
  const UserInfoScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Info")),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
