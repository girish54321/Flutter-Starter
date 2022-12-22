import 'package:flutter/material.dart';

class AppTextH1 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const AppTextH1({Key? key, required this.text, this.color, this.textAlign})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          height: 1.3, fontSize: 40, color: color, fontWeight: FontWeight.bold),
    );
  }
}

class AppTextH2 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight fontWeight;

  const AppTextH2(
      {Key? key,
      required this.text,
      this.color,
      this.textAlign,
      required this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          height: 1.6, fontSize: 28, color: color, fontWeight: fontWeight),
    );
  }
}

class AppTextP1 extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final int? numberOfLine;
  final TextAlign textAlign;
  final Color? color;
  const AppTextP1({
    Key? key,
    required this.text,
    this.fontWeight,
    this.numberOfLine,
    required this.textAlign,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: numberOfLine ?? 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 19,
          height: 1.3,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? colors;

  const SmallText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: colors,
        fontSize: 16,
        height: 1.6,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
