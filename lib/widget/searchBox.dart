import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final double? height;
  final double? radius;
  final TextEditingController? textEditingController;
  final Function function;
  const SearchBox(
      {Key? key,
      this.height,
      this.radius,
      required this.function,
      this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 37,
        padding: const EdgeInsets.only(left: 18),
        decoration: BoxDecoration(
            color: const Color(0xFFefefef),
            borderRadius: BorderRadius.circular(radius ?? 24.7)),
        child: Center(
          child: TextFormField(
            controller: textEditingController,
            onFieldSubmitted: (string) {
              function(string);
            },
            decoration: const InputDecoration(
                icon: Icon(Icons.search, color: Colors.black),
                border: InputBorder.none,
                hintText: 'Search Store',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ));
  }
}
