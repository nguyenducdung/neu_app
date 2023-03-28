import 'package:flutter/material.dart';
import 'package:neu_app/resource/app_colors.dart';
import 'package:neu_app/utils/routes/navigation_utils.dart';

class PopupLoading {
  PopupLoading._();

  static show(BuildContext context) {
    if (ModalRoute.of(context)?.isCurrent != true) {
      return;
    }
    double padding = MediaQuery.of(context).size.width / 3;
    return showDialog(
        barrierColor: kcBlackOpacity_85,
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
            child: Dialog(
              insetPadding: EdgeInsets.all(padding),
              alignment: Alignment.center,
              backgroundColor: kcNeutralWhite_500,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const CircularProgressIndicator(),
            ),
            onWillPop: () async => false));
  }

  static hide(BuildContext context) {
    if (ModalRoute.of(context)?.isCurrent != true) {
      pop(context: context);
    }
  }
}
