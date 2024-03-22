import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/screens/face_detection/take_picture/take_picture_provider.dart';
import 'package:study_flutter/utils/asset_path.dart';

class RegisterPicture extends ConsumerWidget {
  const RegisterPicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picture = ref.watch(takePictureProvider);
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Profile Picture',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
                color: Colors.purple,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: picture.imageFromDevice != null
                    ? FileImage(picture.imageFromDevice!)
                    : const AssetImage(AssetPath.ifyLogo710) as ImageProvider,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              ref.read(takePictureProvider.notifier).getImageFromCamera();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
            icon: const Icon(Icons.photo_camera),
            label: const Text('take photo'),
          ),
          picture.errorUploading
              ? const Flexible(
                  child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'error uploading picture',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ))
              : Container(),
        ],
      ),
    );
  }
}
