import 'package:flutter/material.dart';

class ArticleChip extends StatelessWidget {
  final String title;
  const ArticleChip({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 12),
        child: Chip(
          backgroundColor: Colors.indigo,
          labelStyle: const TextStyle(color: Colors.white),
          onDeleted: () => {},
          label: Text(
            title,
          ),
        ));
  }
}
