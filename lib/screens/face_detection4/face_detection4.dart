import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:study_flutter/routes/app_routes.dart';

List<CameraDescription> cameras = [];

class FaceDetection4 extends ConsumerStatefulWidget {
  const FaceDetection4({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FaceDetection4State();
}

class _FaceDetection4State extends ConsumerState<FaceDetection4> {
  void getCameras() async {
    cameras = await availableCameras();
  }

  @override
  void initState() {
    super.initState();
    getCameras();
  }

  Widget _buildIconWidget(IconData icon) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Icon(icon, size: 24),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 80,
          width: 350,
          child: OutlinedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              RouteName.faceDetection4A,
            ),
            style: ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(
              color: Colors.blue,
              width: 1.0,
              style: BorderStyle.solid,
            ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconWidget(Icons.arrow_forward_ios),
                const Text(
                  'Go to face detector',
                  style: TextStyle(fontSize: 20),
                ),
                _buildIconWidget(Icons.arrow_back_ios),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
