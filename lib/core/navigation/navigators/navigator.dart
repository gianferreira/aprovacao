import 'package:flutter/material.dart';

class AprovacaoNavigator {
  static void push({
    required BuildContext context,
    required Widget route,
    required String routeName,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(name: routeName)
      ),
    );
  }

  static void pop({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }

  static void pushReplacement({
    required BuildContext context,
    required Widget route,
    required String routeName,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(name: routeName)
      ),
    );
  }

}
