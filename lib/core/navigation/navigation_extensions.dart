import 'package:flutter/material.dart';
import 'package:gerenciamento_agricola/core/navigation/navigation_helper.dart';

extension NavigationExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  void navigateTo(String route, {Object? arguments}) {
    NavigationHelper.navigateTo(this, route, arguments: arguments);
  }

  void navigateAndReplace(String route, {Object? arguments}) {
    NavigationHelper.navigateAndReplace(this, route, arguments: arguments);
  }

  void navigateAndRemoveUntil(
    String route,
    String untilRoute, {
    Object? arguments,
  }) {
    NavigationHelper.navigateAndRemoveUntil(
      this,
      route,
      untilRoute,
      arguments: arguments,
    );
  }

  void navigateAndClearStack(String route, {Object? arguments}) {
    NavigationHelper.navigateAndClearStack(this, route, arguments: arguments);
  }

  void pop({Object? result}) {
    NavigationHelper.pop(this, result: result);
  }

  Future<T?> navigateToWithResult<T>(String route, {Object? arguments}) {
    return NavigationHelper.navigateToWithResult<T>(
      this,
      route,
      arguments: arguments,
    );
  }

  bool get canPop => NavigationHelper.canPop(this);

  void popUntil(String route) {
    NavigationHelper.popUntil(this, route);
  }

  void popUntilFirst() {
    NavigationHelper.popUntilFirst(this);
  }
}
