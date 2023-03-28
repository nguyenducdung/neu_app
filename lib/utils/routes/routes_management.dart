import 'package:flutter/material.dart';
import 'package:neu_app/ui/login/login.dart';
import 'package:neu_app/ui/login_with_account/login_with_account.dart';
import 'package:neu_app/ui/splash/splash.dart';

class AppRouter {
  static Widget onGenerateRoute(String routeName, Object? argument) {
    switch (routeName) {
      case RouterName.loginPage:
        return LoginPage();
      case RouterName.loginWithAccountPage:
        return LoginWithAccountPage();
      case RouterName.splashPage:
        return SplashPage();
    }
    return SplashPage();
  }
}

class RouterName {
  static const loginPage = "/login";
  static const loginWithAccountPage = "/login_with_account";
  static const splashPage = "/splash";
}
