import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/face_detection4/face_detection4_camera_view.dart';
import 'package:study_flutter/screens/face_detection4/face_painter.dart';

class FaceDetection4A extends ConsumerStatefulWidget {
  const FaceDetection4A({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FaceDetector4PageState();
}

class _FaceDetector4PageState extends ConsumerState<FaceDetection4A> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),
  );

  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FaceDetection4CameraView(
      title: 'Face detector',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.front,
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = FacePainter(
        faces,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = "Faces found: ${faces.length}\n\n";
      for (final face in faces) {
        text += "face: ${face.boundingBox}\n\n";
      }
      _text = text;
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) setState(() {});
  }
}
