import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/FeedScreenUI.dart';
import 'package:reqres_app/state/feedArticleController.dart';

class AppMenuItem {
  final String id;
  final Widget widget;
  AppMenuItem(this.id, this.widget);
}

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FeedArticleController feedArticleController =
      Get.put(FeedArticleController());

  @override
  Widget build(BuildContext context) {
    return FeedScreenUI(
      feedArticleController: feedArticleController,
    );
  }
}
