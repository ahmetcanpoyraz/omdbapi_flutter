// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:omdbapi_flutter/core/utils/sizing_information.dart';

import 'deviceType.dart';


class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      SizingInformation sizingInformation,
      ) builder;
  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraint) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = SizingInformation(
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxConstraint.maxWidth, boxConstraint.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
