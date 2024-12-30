import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Function() function;

  const AppButton(
      {Key? key, this.color, required this.child, required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(color: Colors.black),
        ),
        child: SizedBox(
          height: 55,
          child: child,
        ),
      ),
    );
  }
}

class BlackButton extends StatelessWidget {
  final String buttonText;
  final Function() function;

  const BlackButton(
      {Key? key, required this.buttonText, required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      clipBehavior: Clip.antiAlias,
      onPressed: function,
      style: ElevatedButton.styleFrom(
        // primary: Theme.of(context).accentColor,
        textStyle: TextStyle(color: Colors.white),
      ),
      child: SizedBox(
        height: 55,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class GoBackButton extends StatelessWidget {
  final Color? color;
  final Function() function;
  final double? marginTop;

  const GoBackButton(
      {Key? key, this.color, required this.function, this.marginTop})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10, top: marginTop ?? 42),
        height: 33,
        width: 106,
        child: TextButton(
          onPressed: function,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(EdgeInsets.zero)
              // padding: EdgeInsets.all(1.0),
              ),
          child: Row(
            children: <Widget>[
              Icon(Icons.arrow_back, color: color),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(
                  "BACK",
                  style: TextStyle(fontSize: 18, color: color),
                ),
              ),
            ],
          ),
        ));
  }
}
