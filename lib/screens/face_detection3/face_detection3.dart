import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetection3Screen extends ConsumerStatefulWidget {
  const FaceDetection3Screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FaceDetection3State();
}

class _FaceDetection3State extends ConsumerState<FaceDetection3Screen> {
  File? imageFile;
  late String imageFileName;
  String? processText;

  Future<void> doFaceDetection() async {
    final inputImage = InputImage.fromFile(imageFile!);
    final options = FaceDetectorOptions(
      enableLandmarks: true,
      enableClassification: true,
      enableContours: true,
      enableTracking: true,
    );
    final faceDetector = FaceDetector(options: options);
    //
    final List<Face> faces = await faceDetector.processImage(inputImage);

    for (Face face in faces) {
      final Rect boundingBox = face.boundingBox;
      // Head is tilted up and down rotX degrees
      final double? rotX = face.headEulerAngleX;
      // Head is rotated to the right rotY degrees
      final double? rotY = face.headEulerAngleY;
      // Head is tilted sideways rotZ degrees
      final double? rotZ = face.headEulerAngleZ;

      // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
      // eyes, cheeks, and nose available):
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      if (leftEar != null) {
        final Point<int> leftEarPos = leftEar.position;
      }

      // If classification was enabled with FaceDetectorOptions:
      if (face.smilingProbability != null) {
        final double? smileProb = face.smilingProbability;
      }

      // If face tracking was enabled with FaceDetectorOptions:
      if (face.trackingId != null) {
        final int? id = face.trackingId;
      }
    }
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
    } else {
      setState(() {
        processText = 'Faces found: ${faces.length}\n\n';
      });
    }
    faceDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Detection'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            width: 250,
            child: Container(
              color: Colors.blue,
              child: imageFile == null
                  ? const Text('No image')
                  : Image.file(imageFile!),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(processText ?? ''),
          ElevatedButton(
            onPressed: () async {
              final image = await ImagePicker().pickImage(
                source: ImageSource.camera,
                preferredCameraDevice: CameraDevice.front,
                imageQuality: 50,
              );
              if (image == null) return;
              setState(() {
                imageFile = File(image.path);
                imageFileName = File(imageFile!.path).uri.pathSegments.last;
              });
              await doFaceDetection();
            },
            child: const Text('Take Selfie'),
          ),
        ],
      ),
    );
  }
}
