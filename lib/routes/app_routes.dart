import 'package:flutter/material.dart';
import 'package:study_flutter/pages/api_loading_error/api_loading_error_page.dart';
import 'package:study_flutter/pages/api_loading_error/api_success_page.dart';
import 'package:study_flutter/pages/bottom_nav/bottom_nav_page.dart';
import 'package:study_flutter/pages/future_provider/future_provider_page.dart';
import 'package:study_flutter/pages/home/home_page.dart';
import 'package:study_flutter/pages/sliders/sliders_page.dart';
import 'package:study_flutter/pages/switches/switches_page.dart';
import 'package:study_flutter/pages/textfield_state/textfield_state_page.dart';

abstract class RouteName {
  static const home = '/home';
  static const bottomNavPage = '/bottomNav';
  static const switchesPage = '/switches';
  static const apiLoadingError = '/apiLoadError';
  static const apiSuccess = '/apiSuccess';
  static const futureProviderPage = 'fut_prov_page';
  static const textfieldState = 'text_field_state';
  static const slidersPage = '/slidersPage';
}

Map<String, Widget Function(BuildContext)> appRoutesMap = {
  RouteName.home: (context) => const HomePage(),
  RouteName.bottomNavPage: (context) => const BottomNavPage(),
  RouteName.switchesPage: (context) => const SwitchesPage(),
  RouteName.apiLoadingError: (context) => const ApiLoadingErrorPage(),
  RouteName.apiSuccess: (context) => const ApiSuccessPage(),
  RouteName.futureProviderPage: (context) => const FutureProviderPage(),
  RouteName.textfieldState: (context) => const TextfieldStatePage(),
  RouteName.slidersPage: (context) => const SlidersPage(),
};
