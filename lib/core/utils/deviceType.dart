import 'package:flutter/material.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.other;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.tablet;
  }

  return DeviceScreenType.mobile;
}

enum DeviceScreenType { mobile, tablet, other }
