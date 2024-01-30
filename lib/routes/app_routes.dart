import 'package:flutter/material.dart';
import 'package:study_flutter/pages/api_loading_error/api_loading_error_page.dart';
import 'package:study_flutter/pages/api_loading_error/api_success_page.dart';
import 'package:study_flutter/pages/bottom_nav/bottom_nav_page.dart';
import 'package:study_flutter/pages/future_provider/future_provider_page.dart';
import 'package:study_flutter/pages/home/home_page.dart';
import 'package:study_flutter/pages/infinite_scroll/infinite_scroll_page.dart';
import 'package:study_flutter/pages/infinite_scroll2/infinite_scroll_page2.dart';
import 'package:study_flutter/pages/keyboard/keyboard_page.dart';
import 'package:study_flutter/pages/keyboard2/keyboard_page2.dart';
import 'package:study_flutter/pages/keyboard3/keyboard_page3.dart';
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
  static const keyboardPage = 'keyboardPage';
  static const keyboardPage2 = 'keyboardPage2';
  static const keyboardPage3 = 'keyboardPage3';
  static const infiniteScroll = 'infinite_scroll';
  static const infiniteScroll2 = 'infinite_scroll_2';
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
  RouteName.keyboardPage: (context) => const KeyboardPage(),
  RouteName.keyboardPage2: (context) => const KeyboardPage2(),
  RouteName.keyboardPage3: (context) => const KeyboardPage3(),
  RouteName.infiniteScroll: (context) => const InfiniteScrollPage(),
  RouteName.infiniteScroll2: (context) => const InfiniteScrollPage2(),
};
