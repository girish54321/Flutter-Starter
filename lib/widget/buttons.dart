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
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: function,
      color: color ?? Theme.of(context).colorScheme.secondary,
      textColor: Colors.black,
      child: SizedBox(
        height: 55,
        child: child,
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
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: function,
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
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
      child: FlatButton(
        onPressed: function,
        color: Colors.transparent,
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
      ),
    );
  }
}
