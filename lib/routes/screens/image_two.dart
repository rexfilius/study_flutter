import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageTwo extends StatelessWidget {
  const ImageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade in images'),
      ),
      body: Stack(
        children: <Widget>[
          const Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=9',
            ),
          ),
        ],
      ),
    );
  }
}
