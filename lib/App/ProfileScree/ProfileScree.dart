import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/ProfileScree/ProfileScreeUI.dart';
import 'package:reqres_app/state/authController.dart';
import 'package:reqres_app/state/globleArticleController.dart';

class ProfileScree extends StatefulWidget {
  const ProfileScree({Key? key}) : super(key: key);

  @override
  State<ProfileScree> createState() => _ProfileScreeState();
}

class _ProfileScreeState extends State<ProfileScree> {
  final GlobalArticleController globalArticleController =
      Get.put(GlobalArticleController());

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return ProfileScreeUI(
        globalArticleController: globalArticleController,
        authController: authController);
  }
}
