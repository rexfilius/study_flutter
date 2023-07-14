import 'package:flutter/material.dart';
import 'package:study_flutter/routes/screens/home_screen.dart';
import 'package:study_flutter/routes/screens/image_one.dart';
import 'package:study_flutter/routes/screens/image_three.dart';
import 'package:study_flutter/routes/screens/image_two.dart';

abstract class RouteName {
  static const homeScreen = 'home';
  static const imageOne = 'imageOne';
  static const imageTwo = 'imageTwo';
  static const imageThree = 'imageThree';
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteName.homeScreen: (context) => const HomeScreen(),
  RouteName.imageOne: (context) => const ImageOne(),
  RouteName.imageTwo: (context) => const ImageTwo(),
  RouteName.imageThree: (context) => const ImageThree(),
};
