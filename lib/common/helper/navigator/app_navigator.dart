import 'package:flutter/material.dart';

class AppNavigator {
  static void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }
}
