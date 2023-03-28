import 'package:flutter/material.dart';
import 'package:neu_app/utils/routes/routes_management.dart';

enum AnimationType {
  pushLeft,
  pushRight,
  pushUp,
  pushDown,
  none,
  faceIn,
  faceOut
}

void popUntil({required BuildContext context, required String routeName}) {
  Navigator.popUntil(context, ModalRoute.withName(routeName));
}

void pop({required BuildContext context, Object? arguments}) {
  Navigator.of(context).pop(arguments);
}

void pushAndRemoveUntil(
    {required BuildContext context,
    required String routeName,
    AnimationType animationType = AnimationType.pushLeft,
    Object? arguments}) {
  Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        settings: RouteSettings(arguments: arguments, name: routeName),
        pageBuilder: (context, animation, secondaryAnimation) =>
            AppRouter.onGenerateRoute(routeName, arguments),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return YouthNeuTransitionBuilder.buildTransition(
              animation, child, animationType);
        },
      ),
      (route) => false);
}

void push(
    {required BuildContext context,
    required String routeName,
    AnimationType animationType = AnimationType.pushLeft,
    Object? arguments}) {
  Navigator.of(context).push(PageRouteBuilder(
    settings: RouteSettings(arguments: arguments, name: routeName),
    pageBuilder: (context, animation, secondaryAnimation) =>
        AppRouter.onGenerateRoute(routeName, arguments),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return YouthNeuTransitionBuilder.buildTransition(
          animation, child, animationType);
    },
  ));
}

class YouthNeuTransitionBuilder {
  static Widget buildTransition(
      Animation<double> animation, Widget child, AnimationType type) {
    switch (type) {
      case AnimationType.pushLeft:
        return _pushLeft(animation, child);
      case AnimationType.pushRight:
        return _pushRight(animation, child);
      case AnimationType.pushUp:
        return _pushUp(animation, child);
      case AnimationType.pushDown:
        return _pushDown(animation, child);
      case AnimationType.none:
        return _none(animation, child);
      case AnimationType.faceIn:
        return _faceIn(animation, child);
      case AnimationType.faceOut:
        return _faceOut(animation, child);
      default:
        return _none(animation, child);
    }
  }

  static Widget _pushLeft(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Widget _pushRight(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Widget _pushUp(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Widget _pushDown(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Widget _none(Animation<double> animation, Widget child) {
    return child;
  }

  static Widget _faceIn(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  static Widget _faceOut(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: Tween<double>(begin: 1.0, end: 0.0).animate(animation),
      child: child,
    );
  }
}
