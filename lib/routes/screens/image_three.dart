import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageThree extends StatelessWidget {
  const ImageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached images'),
      ),
      body: Center(
        child: CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageUrl: 'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}
