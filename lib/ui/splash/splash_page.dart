import 'package:flutter/material.dart';
import 'package:neu_app/resource/app_colors.dart';
import 'package:neu_app/ui/base/base.dart';
import 'package:neu_app/ui/splash/splash.dart';
import 'package:neu_app/utils/utils.dart';

class SplashPage extends BasePage {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashPage();
  }
}

class _SplashPage extends BaseState<SplashPage, SplashViewModel> {
  @override
  void initState() {
    super.initState();
    _naviToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcNeutralBlue_200,
      body: SafeArea(
          child: Center(
        child: Text(
          "Đây là màn hình Splash",
          style: TextStyle(color: kcNeutralRed_500),
        ),
      )),
    );
  }

  @override
  void initArgument(Object? arguments) {
    // TODO: implement initArgument
  }

  void _naviToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    push(context: context, routeName: RouterName.loginPage);
  }
}
