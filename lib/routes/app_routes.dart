import 'package:flutter/material.dart';
import 'package:study_flutter/home_screen.dart';
import 'package:study_flutter/image_one.dart';

abstract class RouteName {
  static const homeScreen = 'home';
  static const imageOne = 'imageOne';
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteName.homeScreen: (context) => const HomeScreen(),
  RouteName.imageOne: (context) => const ImageOne(),
};
