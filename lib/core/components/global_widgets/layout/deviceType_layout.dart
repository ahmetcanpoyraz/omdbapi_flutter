// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../utils/deviceType.dart';
import '../../../utils/responsive_builder.dart';



class ScreenTypeLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? other;
  const ScreenTypeLayout({
    Key? key,
    this.mobile,
    this.tablet,
    this.other,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          if (tablet != null) {
            return tablet!;
          }
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.other) {
          if ( other!= null) {
            return other!;
          }
        }

        return mobile!;
      },
    );
  }
}
