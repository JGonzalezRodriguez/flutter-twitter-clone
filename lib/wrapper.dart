import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/login/login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (false) {
      return const MyHomePage(
        title: 'Twitter',
      );
    } else {
      return Login();
    }
  }
}
