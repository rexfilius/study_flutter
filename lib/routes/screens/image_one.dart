import 'package:flutter/material.dart';

class ImageOne extends StatelessWidget {
  const ImageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web images'),
      ),
      body: Image.network('https://picsum.photos/250?image=9'),
    );
  }
}
