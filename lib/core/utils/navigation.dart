import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> pushTo<T>(BuildContext context, Widget page) {
  return Navigator.of(context).push<T>(
    _routeBuilder(page),
  );
}

PageRoute<T> _routeBuilder<T>(Widget page) {
  if (Platform.isIOS) {
    return CupertinoPageRoute<T>(
      builder: (_) => page,
    );
  } else {
    return MaterialPageRoute<T>(
      builder: (_) => page,
    );
  }
}

PageRoute<T> _routeBuilderWithAnimation<T>(
  Widget page,
  NavigationAnimationType type,
) {
  return NavigationHelper.createRoute(page, type);
}

Future<T?> pushAndReplace<T>(BuildContext context, Widget page) {
  return Navigator.of(context).pushReplacement(
    _routeBuilder(page),
  );
}

Future<T?> pushToAndRemoveAll<T>(BuildContext context, Widget page) {
  return Navigator.of(context).pushAndRemoveUntil(
    _routeBuilder(page),
    (_) => false,
  );
}

extension BuildContextExtensions on BuildContext {
  Future<T?> push<T>(Widget page, [T? result]) {
    return Navigator.of(this).push<T>(
      _routeBuilder(page),
    );
  }

  Future<T?> pushWithAnimation<T>(
    Widget page,
    NavigationAnimationType type,
  ) {
    return Navigator.of(this).push<T>(
      _routeBuilderWithAnimation(page, type),
    );
  }

  Future<T?> replaceWithAnimation<T>(
    Widget page,
    NavigationAnimationType type,
  ) {
    return Navigator.of(this).pushReplacement(
      _routeBuilderWithAnimation(page, type),
    );
  }

  Future<T?> pushAndRemoveAllWithAnimation<T>(
    Widget page,
    NavigationAnimationType type,
  ) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      _routeBuilderWithAnimation(page, type),
      (_) => false,
    );
  }

  /*Future<T?> pushAndReplace<T, TO>(Widget page, [TO? result]) {
    return Navigator.of(this).pushReplacement<T, TO>(
      _routeBuilder(page),
    );
  }*/

  Future<Object?> pushAndReplace(Widget page, [Object? result]) {
    return Navigator.of(this).pushReplacement(
      _routeBuilder(page),
    );
  }

  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      _routeBuilder(page),
      (_) => false,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void popUntil(Widget page, [RoutePredicate? predicate]) {
    Navigator.of(this).popUntil(
      predicate ?? ModalRoute.withName(page.toString()),
    );
  }

  void popUntilRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
}

enum NavigationAnimationType {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

// ignore: avoid_classes_with_only_static_members
class NavigationHelper {
  static PageRoute<T> createRoute<T>(
    Widget page,
    NavigationAnimationType type,
  ) {
    switch (type) {
      case NavigationAnimationType.leftToRight:
        return createRouteLeftToRight<T>(page);
      case NavigationAnimationType.rightToLeft:
        return createRouteRightToLeft<T>(page);
      case NavigationAnimationType.topToBottom:
        return createRouteTopToBottom<T>(page);
      case NavigationAnimationType.bottomToTop:
        return createRouteBottomToTop<T>(page);
    }
  }

  // Bottom to Top Animation
  static PageRoute<T> createRouteBottomToTop<T>(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1); // Start from the bottom
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  // Left to Right Animation
  static PageRoute<T> createRouteLeftToRight<T>(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1, 0); // Start from the left
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  // Right to Left Animation
  static PageRoute<T> createRouteRightToLeft<T>(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0); // Start from the right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  // Top to Bottom Animation
  static PageRoute<T> createRouteTopToBottom<T>(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, -1); // Start from the top
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
