import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flutter/home/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
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
                    image: homeState.imageFromCamera != null
                        ? FileImage(homeState.imageFromCamera!)
                        : const AssetImage('assets/images/camera_img.jpg')
                            as ImageProvider),
                color: Colors.blue.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    ref.read(homeProvider.notifier).getImageFromCamera2(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                  ),
                  icon: const Icon(Icons.camera),
                  label: const Text('Take Photo'),
                ),
                const SizedBox(width: 8.0),
                TextButton.icon(
                  onPressed: () {
                    ref.read(homeProvider.notifier).getImageFromGallery();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                  ),
                  icon: const Icon(Icons.camera),
                  label: const Text('Upload Photo'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(homeProvider.notifier).convertGalleryImageToBase64();
              },
              child: const Text('Show Base64 String'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(homeProvider.notifier).getFileFromDevice();
              },
              child: const Text('Upload File'),
            ),
            Text("${homeState.fileFromDevice?.path}"),
            Expanded(
              child: Text(homeState.imageAsString),
            ),
          ],
        ),
      ),
    );
  }
}
