import 'package:flutter/material.dart';

class RightIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.check, color: Theme.of(context).colorScheme.secondary);
  }
}

class WorngIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.close, color: Colors.red);
  }
}
