import 'package:flutter/material.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenUI.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScreenUI();
  }
}
