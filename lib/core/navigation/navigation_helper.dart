import 'package:flutter/material.dart';

class NavigationHelper {
  static void navigateTo(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, route, arguments: arguments);
  }

  static void navigateAndReplace(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, route, arguments: arguments);
  }

  static void navigateAndRemoveUntil(
    BuildContext context,
    String route,
    String untilRoute, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      ModalRoute.withName(untilRoute),
      arguments: arguments,
    );
  }

  static void navigateAndClearStack(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static void pop(BuildContext context, {Object? result}) {
    Navigator.pop(context, result);
  }

  static Future<T?> navigateToWithResult<T>(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(context, route, arguments: arguments);
  }

  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  static void popUntil(BuildContext context, String route) {
    Navigator.popUntil(context, ModalRoute.withName(route));
  }

  static void popUntilFirst(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}

class RouteArguments {
  final String? id;
  final Map<String, dynamic>? data;
  final bool isEditing;

  const RouteArguments({this.id, this.data, this.isEditing = false});

  T? getData<T>(String key) {
    return data?[key] as T?;
  }
}
