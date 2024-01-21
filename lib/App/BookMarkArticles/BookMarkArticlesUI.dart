import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/state/bookmarkArticleController.dart';
import 'package:reqres_app/widget/articleItem.dart';

class BookMarkArticlesUI extends StatelessWidget {
  final BookArticleController bookArticleController;
  const BookMarkArticlesUI({
    Key? key,
    required this.bookArticleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
      ),
      body: Obx((() => ListView.builder(
            itemCount:
                bookArticleController.bookMarkArticles.value.articles?.length,
            itemBuilder: (context, index) {
              ArticlesResponseArticles? item =
                  bookArticleController.bookMarkArticles.value.articles?[index];
              return ArticleItem(
                item: item,
              );
            },
          ))),
      // body: ,
    );
  }
}
