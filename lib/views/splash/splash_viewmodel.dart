// ignore_for_file: implementation_imports

import 'dart:async';
import 'package:flutter/src/widgets/framework.dart';
import '../../core/base/base_viewmodel/base_viewmodel.dart';
import '../../core/constants/navigation_constant.dart';

class SplashViewModel extends BaseViewModel {

  bool isCheck = true;
  onChecked() {
    isCheck != isCheck;
  }

  @override
  FutureOr<void> init() async {
    changeStatus();
    Future.delayed(const Duration(seconds: 2), () {
      navigation.navigateToPageClear(path: NavigationConstants.bottomNavigationBar);
    });
  }



  @override
  void setContext(BuildContext context) => this.context = context;
}
