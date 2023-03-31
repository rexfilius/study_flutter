import 'package:flutter/material.dart';
import 'package:study_flutter/home_page.dart';
import 'package:study_flutter/receive_input.dart';

abstract class RouteName {
  static const String customKey = '/customKey';
  static const String receiveInput = '/receiveInput';
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteName.customKey: (context) => const HomePage(),
  RouteName.receiveInput: (context) => const ReceiveInput(),
};
