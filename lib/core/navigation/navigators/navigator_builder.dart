import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:flutter/material.dart';

class AprovacaoNavigatorBuilder {
  static Widget push({
    required BuildContext context,
    required Widget route,
    required String routeName,
  }) {
    _pushCallback(
      context: context,
      route: route,
      routeName: routeName,
    );

    return _emptyComponent();
  }

  static Widget pop({
    required BuildContext context,
  }) {
    _popCallback(
      context: context,
    );

    return _emptyComponent();
  }

  static Widget pushReplacement({
    required BuildContext context,
    required Widget route,
    required String routeName,
    Color? color,
  }) {
    _pushReplacementCallback(
      context: context,
      route: route,
      routeName: routeName,
    );

    return _replacementComponent(
      color: color,
    );
  }

  static Future<void> _pushCallback({
    required BuildContext context,
    required Widget route,
    required String routeName,
  }) async {
    await Future.delayed(Duration.zero);

    AprovacaoNavigator.push(
      context: context, 
      route: route, 
      routeName: routeName,
    );
  }

  static Future<void> _popCallback({
    required BuildContext context,
  }) async {
    await Future.delayed(Duration.zero);

    AprovacaoNavigator.pop(context: context);
  }

  static Future<void> _pushReplacementCallback({
    required BuildContext context,
    required Widget route,
    required String routeName,
  }) async {
    await Future.delayed(Duration.zero);

    AprovacaoNavigator.pushReplacement(
      context: context, 
      route: route, 
      routeName: routeName,
    );
  }

  static Widget _emptyComponent() {
    return SizedBox.shrink();
  }

  static Widget _replacementComponent({
    required Color? color,
  }) {
    return color != null 
      ? Scaffold(
          backgroundColor: color,
        )
      : Scaffold();
  }
}
