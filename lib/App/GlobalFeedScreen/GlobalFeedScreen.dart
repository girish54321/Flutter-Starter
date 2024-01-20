import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GlobalFeedScreen/GlobalFeedScreenUI.dart';
import 'package:reqres_app/state/globleArticleController.dart';

class GlobalFeedScreen extends StatefulWidget {
  GlobalFeedScreen({Key? key}) : super(key: key);

  @override
  State<GlobalFeedScreen> createState() => _GlobalFeedScreenState();
}

class _GlobalFeedScreenState extends State<GlobalFeedScreen> {
  final GlobalArticleController globalArticleController =
      Get.put(GlobalArticleController());

  @override
  Widget build(BuildContext context) {
    return GlobalFeedScreenUI(
      globalArticleController: globalArticleController,
    );
  }
}
