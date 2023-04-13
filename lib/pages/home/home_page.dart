import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              Navigator.pushNamed(
                context,
                RouteName.bottomNavPage,
              );
            },
          ),
          ListTile(
            title: const Text('Switches Page'),
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteName.switchesPage,
              );
            },
          ),
        ],
      ),
    );
  }
}
