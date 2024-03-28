import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/routes/app_routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: const Text('Learning Flutter'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: appPages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(appPages[index].title),
            onTap: () {
              Navigator.pushNamed(context, appPages[index].route);
            },
          );
        },
      ),
    );
  }
}

const appPages = <AppScreen>[
  AppScreen(title: 'Bottom Navigation', route: RouteName.bottomNavPage),
  AppScreen(title: 'Switches Page', route: RouteName.switchesPage),
  AppScreen(title: 'API Loading Error Page', route: RouteName.apiLoadingError),
  AppScreen(title: 'Future Provider Page', route: RouteName.futureProviderPage),
  AppScreen(title: 'Textfield State', route: RouteName.textfieldState),
  AppScreen(title: 'Sliders', route: RouteName.slidersPage),
  AppScreen(title: 'Keyboard', route: RouteName.keyboardPage),
  AppScreen(title: 'Keyboard II', route: RouteName.keyboardPage2),
  AppScreen(title: 'Keyboard III', route: RouteName.keyboardPage3),
  AppScreen(title: 'Keyboard IV', route: RouteName.keyboardPage4),
  AppScreen(title: 'Infinite Scroll', route: RouteName.infiniteScroll),
  AppScreen(title: 'Progress Indicator', route: RouteName.progressIndicator),
  AppScreen(
      title: 'Face Detection (Take Picture)', route: RouteName.faceDetection),
  AppScreen(
      title: 'Face Detection (Google ML Kit)', route: RouteName.faceDetection2),
  AppScreen(
      title: 'Face Detection (My Iteration)', route: RouteName.faceDetection3),
  AppScreen(
      title: 'Face Detection (Youtube tutor)', route: RouteName.faceDetection4),
  AppScreen(
      title: 'Face Detection (Face Camera Plugin)',
      route: RouteName.faceDetection5),
];

class AppScreen {
  final String title;
  final String route;

  const AppScreen({
    required this.title,
    required this.route,
  });
}
