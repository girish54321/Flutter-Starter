import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/state/feedArticleController.dart';
import 'package:reqres_app/widget/articleItem.dart';

class FeedScreenUI extends StatelessWidget {
  final FeedArticleController feedArticleController;
  const FeedScreenUI({
    Key? key,
    required this.feedArticleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
      ),
      body: Obx((() => ListView.builder(
            itemCount: feedArticleController.articles.value.articles?.length,
            itemBuilder: (context, index) {
              ArticlesResponseArticles? item =
                  feedArticleController.articles.value.articles?[index];
              return ArticleItem(
                item: item,
              );
            },
          ))),
      // body: ,
    );
  }
}
