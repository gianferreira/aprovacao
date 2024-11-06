import 'package:flutter/material.dart';
import 'package:professional_development/core/navigation/arguments/args.dart';
import 'package:professional_development/core/navigation/navigators/navigator.dart';

class DevProNavigatorBuilder {
  static Widget push({
    required BuildContext context,
    required String routeName,
    required Args args,
  }) {
    _pushCallback(
      context: context,
      routeName: routeName,
      args: args,
    );

    return _pushComponent();
  }

  static Widget pushReplacement({
    required BuildContext context,
    required String routeName,
    required Args args,
  }) {
    _pushReplacementCallback(
      context: context,
      routeName: routeName,
      args: args,
    );

    return _replacementComponent();
  }

  static Widget pop({
    required BuildContext context,
  }) {
    _popCallback(
      context: context,
    );

    return _popComponent();
  }

  static Future<void> _pushCallback({
    required BuildContext context,
    required String routeName,
    required Args args,
  }) async {
    await Future.delayed(Duration.zero);

    DevProNavigator.push(
      context: context, 
      routeName: routeName,
      args: args,
    );
  }

  static Future<void> _pushReplacementCallback({
    required BuildContext context,
    required String routeName,
    required Args args,
  }) async {
    await Future.delayed(Duration.zero);

    DevProNavigator.pushReplacement(
      context: context, 
      routeName: routeName,
      args: args,
    );
  }

  static Future<void> _popCallback({
    required BuildContext context,
  }) async {
    await Future.delayed(Duration.zero);

    DevProNavigator.pop(context: context);
  }

  static Widget _pushComponent() {
    return SizedBox.shrink();
  }

  static Widget _replacementComponent() {
    return Scaffold();
  }

  static Widget _popComponent() {
    return SizedBox.shrink();
  }
}
