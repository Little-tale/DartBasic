import 'package:day07_instargram/UI/screens/home_screen.dart';
import 'package:day07_instargram/UI/screens/search_screen.dart';
import 'package:flutter/material.dart';

class InstarBody extends StatelessWidget {
  final int index;

  const InstarBody({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        return SearchScreen();
      case 0:
      default:
        return HomeScreen();
    }
  }
}
