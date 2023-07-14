import 'package:flutter/material.dart';
import 'package:study_flutter/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Display images from the internet'),
            onTap: () {
              Navigator.pushNamed(context, RouteName.imageOne);
            },
          ),
          ListTile(
            title: Text('Fade in images with a placeholder'),
          )
        ],
      ),
    );
  }
}
