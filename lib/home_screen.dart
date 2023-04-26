import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final netImageUrl = 'https://picsum.photos/250?image=9';
  File? _imageAsFile;
  String _imageAsString = '';
  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporal = File(image.path);
    setState(() {
      _imageAsFile = imageTemporal;
    });
  }

  Future<void> convertImageToBase64() async {
    if (_imageAsFile != null) {
      Uint8List imageAsBytes = await _imageAsFile!.readAsBytes();
      final base64String = base64.encode(imageAsBytes);
      setState(() {
        _imageAsString = base64String;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10.0),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: _imageAsFile != null
                      ? FileImage(_imageAsFile!)
                      : NetworkImage(netImageUrl) as ImageProvider,
                ),
                color: Colors.blue.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: getImageFromCamera,
              style: TextButton.styleFrom(
                backgroundColor: Colors.amberAccent,
              ),
              icon: const Icon(Icons.camera),
              label: const Text('Take selfie'),
            ),
            ElevatedButton(
              onPressed: convertImageToBase64,
              child: const Text('Show Base64 String'),
            ),
            Expanded(
              child: Text(_imageAsString),
            ),
          ],
        ),
      ),
    );
  }
}
