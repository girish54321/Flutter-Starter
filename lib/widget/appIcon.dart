import 'package:flutter/material.dart';

class RightIcon extends StatelessWidget {
  const RightIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.check, color: Theme.of(context).colorScheme.secondary);
  }
}

class WrongIcon extends StatelessWidget {
  const WrongIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.close, color: Colors.red);
  }
}
