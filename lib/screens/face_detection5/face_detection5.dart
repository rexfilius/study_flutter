import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:face_camera/face_camera.dart';

class FaceDetection5 extends ConsumerStatefulWidget {
  const FaceDetection5({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FaceDetection5State();
}

class _FaceDetection5State extends ConsumerState<FaceDetection5> {
  String message = 'Center your face in the square';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SmartFaceCamera(
        autoCapture: true,
        defaultCameraLens: CameraLens.front,
        message: message,
        orientation: CameraOrientation.portraitUp,
        onCapture: (imageFile) {
          setState(() {
            message = 'image captured';
          });
        },
        onFaceDetected: (face) {
          setState(() {
            message = 'Face detected';
          });
        },
      ),
    );
  }
}
