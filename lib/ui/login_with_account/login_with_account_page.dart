import 'package:flutter/material.dart';
import 'package:neu_app/resource/app_colors.dart';
import 'package:neu_app/ui/base/base.dart';
import 'package:neu_app/ui/login_with_account/login_with_account.dart';

class LoginWithAccountPage extends BasePage {
  const LoginWithAccountPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginWithAccountPage();
  }
}

class _LoginWithAccountPage
    extends BaseState<LoginWithAccountPage, LoginWithAccountViewModel> {
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
            child: Text(
              "Đây là màn hình Đăng nhập với tài khoản",
              style: TextStyle(color: kcNeutralRed_500),
            ),
          )),
    );
  }

  @override
  void initArgument(Object? arguments) {
    // TODO: implement initArgument
  }
}
