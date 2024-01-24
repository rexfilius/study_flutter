import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/routes/app_routes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
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

const appPages = <AppPage>[
  AppPage(title: 'Bottom Navigation', route: RouteName.bottomNavPage),
  AppPage(title: 'Switches Page', route: RouteName.switchesPage),
  AppPage(title: 'API Loading Error Page', route: RouteName.apiLoadingError),
  AppPage(title: 'Future Provider Page', route: RouteName.futureProviderPage),
  AppPage(title: 'Textfield State', route: RouteName.textfieldState),
  AppPage(title: 'Sliders', route: RouteName.slidersPage),
  AppPage(title: 'Keyboard', route: RouteName.keyboardPage),
  AppPage(title: 'Keyboard II', route: RouteName.keyboardPage2),
  AppPage(title: 'Keyboard III', route: RouteName.keyboardPage3),
];

class AppPage {
  final String title;
  final String route;

  const AppPage({
    required this.title,
    required this.route,
  });
}
