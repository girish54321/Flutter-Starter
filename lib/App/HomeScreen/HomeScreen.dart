import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenUI.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/network/remote_data_source.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RemoteDataSource _apiResponse = RemoteDataSource();

  void userLogout() {
    final box = GetStorage();
    box.remove('token');
    Get.offAll(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreenUI(
      userLogout: userLogout,
      remoteDataSource: _apiResponse,
    );
  }
}
