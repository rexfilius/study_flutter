import 'package:flutter/material.dart';
import 'package:study_flutter/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Display images from the internet'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.imageOne);
            },
          ),
          ListTile(
            title: const Text('Fade in images with a placeholder'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.imageTwo);
            },
          ),
          ListTile(
            title: const Text('Work with cached images'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.imageThree);
            },
          ),
        ],
      ),
    );
  }
}
