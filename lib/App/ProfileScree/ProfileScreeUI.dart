import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/state/authController.dart';
import 'package:reqres_app/state/globleArticleController.dart';
import 'package:reqres_app/widget/articleItem.dart';
import 'package:reqres_app/widget/profileView.dart';

class ProfileScreeUI extends StatelessWidget {
  final GlobalArticleController globalArticleController;
  final AuthController authController;

  const ProfileScreeUI(
      {Key? key,
      required this.globalArticleController,
      required this.authController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Obx((() => ListView.builder(
            itemCount:
                globalArticleController.articles.value.articles!.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                var userData = authController.userData.value;
                return ProfileView(
                  userName: userData.username,
                  userBio: userData.bio,
                  userImage: userData.image,
                );
              }
              index -= 1;
              ArticlesResponseArticles? item =
                  globalArticleController.articles.value.articles?[index];
              return ArticleItem(
                item: item,
              );
            },
          ))),
    );
  }
}
