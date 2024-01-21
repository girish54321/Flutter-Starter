import 'package:flutter/material.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/articalChip.dart';

class ArticleItem extends StatelessWidget {
  final ArticlesResponseArticles? item;
  const ArticleItem({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 12, right: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            Helper().viewArticle(context: context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.title ?? "",
                  style: const TextStyle(fontSize: 18, height: 1.5),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  item?.description ?? "",
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 12,
                ),
                Wrap(
                  children: [
                    ...(item?.tagList ?? [])
                        .map((e) => ArticleChip(title: e ?? ""))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
