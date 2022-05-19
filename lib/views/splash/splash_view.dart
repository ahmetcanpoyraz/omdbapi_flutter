import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omdbapi_flutter/views/splash/splash_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../core/base/base_view/base_view.dart';
import '../../core/constants/assets_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: Provider.of<SplashViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      onPageBuilder: (context, viewModel, child) => Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 140.h, bottom: 50.h),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(AssetPath.kSplashLogo)),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

}
