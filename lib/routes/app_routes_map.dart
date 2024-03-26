import 'package:flutter/material.dart';
import 'package:study_flutter/routes/app_routes.dart';
import 'package:study_flutter/screens/api_loading_error/api_loading_error_page.dart';
import 'package:study_flutter/screens/api_loading_error/api_success_page.dart';
import 'package:study_flutter/screens/bottom_nav/bottom_nav_page.dart';
import 'package:study_flutter/screens/face_detection/face_detection_screen.dart';
import 'package:study_flutter/screens/face_detection2/face_detection_view.dart';
import 'package:study_flutter/screens/face_detection3/face_detection3.dart';
import 'package:study_flutter/screens/face_detection4/face_detection4.dart';
import 'package:study_flutter/screens/face_detection4/face_detection4a.dart';
import 'package:study_flutter/screens/future_provider/future_provider_page.dart';
import 'package:study_flutter/screens/home/home_page.dart';
import 'package:study_flutter/screens/infinite_scroll/infinite_scroll_page.dart';
import 'package:study_flutter/screens/infinite_scroll2/infinite_scroll_page2.dart';
import 'package:study_flutter/screens/keyboard/keyboard_page.dart';
import 'package:study_flutter/screens/keyboard2/keyboard_page2.dart';
import 'package:study_flutter/screens/keyboard3/keyboard_page3.dart';
import 'package:study_flutter/screens/keyboard4/keyboard_page4.dart';
import 'package:study_flutter/screens/progress_indicator/progress_indicator.dart';
import 'package:study_flutter/screens/sliders/sliders_page.dart';
import 'package:study_flutter/screens/switches/switches_page.dart';
import 'package:study_flutter/screens/textfield_state/textfield_state_page.dart';

Map<String, Widget Function(BuildContext)> appRoutesMap = {
  RouteName.home: (context) => const HomeScreen(),
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
  RouteName.keyboardPage4: (context) => const KeyboardPage4(),
  RouteName.infiniteScroll: (context) => const InfiniteScrollPage(),
  RouteName.infiniteScroll2: (context) => const InfiniteScrollPage2(),
  RouteName.progressIndicator: (context) => const ProgressIndicatorPage(),
  RouteName.faceDetection: (context) => const FaceDetectionScreen(),
  RouteName.faceDetection2: (context) => const FaceDetectionView(),
  RouteName.faceDetection3: (context) => const FaceDetection3Screen(),
  RouteName.faceDetection4: (context) => const FaceDetection4(),
  RouteName.faceDetection4A: (context) => const FaceDetection4A(),
};
