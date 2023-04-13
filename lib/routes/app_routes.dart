import 'package:flutter/material.dart';
import 'package:study_flutter/pages/bottom_nav/bottom_nav_page.dart';
import 'package:study_flutter/pages/home/home_page.dart';
import 'package:study_flutter/pages/switches/switches_page.dart';

abstract class RouteName {
  static const home = '/home';
  static const bottomNavPage = '/bottomNav';
  static const switchesPage = '/switches';
}

Map<String, Widget Function(BuildContext)> appRoutesMap = {
  RouteName.home: (context) => const HomePage(),
  RouteName.bottomNavPage: (context) => const BottomNavPage(),
  RouteName.switchesPage: (context) => const SwitchesPage(),
};
