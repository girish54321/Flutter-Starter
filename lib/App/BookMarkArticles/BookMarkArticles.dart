import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/BookMarkArticles/BookMarkArticlesUI.dart';
import 'package:reqres_app/state/authController.dart';
import 'package:reqres_app/state/bookmarkArticleController.dart';

class BookMarkArticles extends StatefulWidget {
  BookMarkArticles({Key? key}) : super(key: key);

  @override
  State<BookMarkArticles> createState() => _BookMarkArticlesState();
}

class _BookMarkArticlesState extends State<BookMarkArticles> {
  final BookArticleController bookArticleController =
      Get.put(BookArticleController());

  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return BookMarkArticlesUI(
      bookArticleController: bookArticleController,
    );
  }
}
