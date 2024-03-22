import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/face_detection/take_picture/take_picture.dart';

class FaceDetectionScreen extends ConsumerStatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends ConsumerState<FaceDetectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Face Detection')),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RegisterPicture(),
        ],
      ),
    );
  }
}
