import 'package:flutter/material.dart';
import 'package:aprovacao/core/navigation/arguments/args.dart';

class DevProNavigator {
  static void push({
    required BuildContext context,
    required String routeName,
    required Args args,
  }) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: args,
    );
  }

  static void pushReplacement({
    required BuildContext context,
    required String routeName,
    required Args args,
  }) {
    Navigator.of(context).pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static void pop({
    required BuildContext context,
  }) {
    Navigator.of(context).pop();
  }
}
