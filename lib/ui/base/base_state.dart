import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neu_app/di.dart';
import 'package:neu_app/ui/base/base_view_model.dart';
import 'package:neu_app/ui/dialog/popup_loading.dart';

abstract class BaseState<T extends StatefulWidget, V extends BaseViewModel> extends State<T> with WidgetsBindingObserver{
  bool isBackground = false;
  V? viewModel;

  @override
  void initState() {
    viewModel = getIt<V>();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Future.delayed(Duration.zero, () {
      setState(() {
        initArgument(ModalRoute.of(context)?.settings.arguments);
      });
    });
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    viewModel?.isLoading.stream.listen((event) {
      if (event) {
        PopupLoading.show(context);
      } else {
        PopupLoading.hide(context);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('===appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        isBackground = false;
        print('===appLifeCycleState resumed');
        break;
      case AppLifecycleState.paused:
        isBackground = true;
        print('===appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('===appLifeCycleState detached');
        break;
    }
  }

  @protected
  void initArgument(Object? arguments);
}