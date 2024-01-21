import 'package:flutter/material.dart';
import 'package:reqres_app/App/ArticleViewScreen/ArticleViewScreenUI.dart';

class ArticleViewScreen extends StatefulWidget {
  const ArticleViewScreen({Key? key}) : super(key: key);

  @override
  State<ArticleViewScreen> createState() => _ArticleViewScreenState();
}

class _ArticleViewScreenState extends State<ArticleViewScreen> {
  @override
  Widget build(BuildContext context) {
    return ArticleViewScreenUI();
  }
}
