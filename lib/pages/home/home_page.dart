import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/routes/app_routes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            title: const Text('Bottom Navigation'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.bottomNavPage);
            },
          ),
          ListTile(
            title: const Text('Switches Page'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.switchesPage);
            },
          ),
          ListTile(
            title: const Text('API Loading Error Page'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.apiLoadingError);
            },
          ),
          ListTile(
            title: const Text('Future Provider Page'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.futureProviderPage);
            },
          ),
          ListTile(
            title: const Text('Textfield State'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.textfieldState);
            },
          ),
          ListTile(
            title: const Text('Sliders'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.slidersPage);
            },
          ),
        ],
      ),
    );
  }
}
