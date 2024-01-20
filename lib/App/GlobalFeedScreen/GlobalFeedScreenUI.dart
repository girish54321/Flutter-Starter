import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/state/globleArticleController.dart';
import 'package:reqres_app/widget/articleItem.dart';

class GlobalFeedScreenUI extends StatelessWidget {
  final GlobalArticleController globalArticleController;
  const GlobalFeedScreenUI({
    Key? key,
    required this.globalArticleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Globe"),
      ),
      body: Obx((() => ListView.builder(
            itemCount: globalArticleController.articles.value.articles?.length,
            itemBuilder: (context, index) {
              ArticlesResponseArticles? item =
                  globalArticleController.articles.value.articles?[index];
              return ArticleItem(
                item: item,
              );
            },
          ))),
      // body: ,
    );
  }
}
