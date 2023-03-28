import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neu_app/l10n/locale_keys.g.dart';
import 'package:neu_app/resource/app_colors.dart';
import 'package:neu_app/ui/base/base.dart';
import 'package:neu_app/ui/login/login.dart';
import 'package:neu_app/utils/utils.dart';

class LoginPage extends BasePage {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends BaseState<LoginPage, LoginViewModel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcNeutralBlue_200,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Đây là màn hình đăng nhập",
              style: TextStyle(color: kcNeutralRed_500),
            ),
            TextButton(
                onPressed: () {
                  push(context: context, routeName: RouterName.loginPage);
                },
                child: Text(
                  LocaleKeys.login_login.tr(),
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(height: 24),
            TextButton(
                onPressed: () {
                  push(context: context, routeName: RouterName.loginWithAccountPage);
                },
                child: Text(
                  "Đăng nhập với tài khoản",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      )),
    );
  }

  @override
  void initArgument(Object? arguments) {
    // TODO: implement initArgument
  }
}
