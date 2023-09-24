import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_flutter/home_screen_state.dart';

final homeProvider = NotifierProvider<HomeNotifier, HomeScreenState>(
  () => HomeNotifier(),
);

class HomeNotifier extends Notifier<HomeScreenState> {
  @override
  HomeScreenState build() {
    return const HomeScreenState(
      imageFromCamera: null,
      imageFromGallery: null,
      imageAsString: '',
    );
  }

  Future<void> getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporal = File(image.path);
    state = state.copyWith(imageFromCamera: imageTemporal);
  }

  Future<void> getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final img = File(image.path);
    state = state.copyWith(imageFromGallery: img);
  }

  Future<void> convertCameraImageToBase64() async {
    if (state.imageFromCamera != null) {
      Uint8List imageAsBytes = await state.imageFromCamera!.readAsBytes();
      final base64String = base64.encode(imageAsBytes);
      state = state.copyWith(imageAsString: base64String);
    }
  }

  Future<void> convertGalleryImageToBase64() async {
    if (state.imageFromGallery != null) {
      Uint8List imageBytes = await state.imageFromGallery!.readAsBytes();
      final base64Str = base64.encode(imageBytes);
      state = state.copyWith(imageAsString: base64Str);
    }
  }
}
