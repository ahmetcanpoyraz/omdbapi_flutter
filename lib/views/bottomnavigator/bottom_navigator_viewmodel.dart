import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../../core/base/base_viewmodel/base_viewmodel.dart';

class CustomBottomNavigationViewModel extends BaseViewModel {
  bool isInit = false;
  int count = 0;
  String? pageNameString;
  late bool iconBool;
  late IconData iconLight = Icons.wb_sunny;
  late IconData iconDark = Icons.nights_stay;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  void changeTheme(bool trueOrFalse){
    iconBool = trueOrFalse;
    notifyListeners();
  }

  int number = 0;
  static const List<Destination> destinations = Destination.values;

  int selectedDestinationIndex = destinations.indexOf(Destination.Home);

  Destination get selectedDestination => destinations[selectedDestinationIndex];

  void selectDestination(int index) {
    selectedDestinationIndex = index;
    notifyListeners();
  }
}

enum Destination { Home, Favorites }