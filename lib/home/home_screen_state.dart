import 'dart:io';

import 'package:equatable/equatable.dart';

class HomeScreenState extends Equatable {
  final File? imageFromCamera;
  final File? imageFromGallery;
  final String imageAsString;
  final File? fileFromDevice;

  const HomeScreenState({
    required this.imageFromCamera,
    required this.imageFromGallery,
    required this.imageAsString,
    required this.fileFromDevice,
  });

  HomeScreenState copyWith({
    File? imageFromCamera,
    File? imageFromGallery,
    String? imageAsString,
    File? fileFromDevice,
  }) {
    return HomeScreenState(
      imageFromCamera: imageFromCamera ?? this.imageFromCamera,
      imageFromGallery: imageFromGallery ?? this.imageFromGallery,
      imageAsString: imageAsString ?? this.imageAsString,
      fileFromDevice: fileFromDevice ?? this.fileFromDevice,
    );
  }

  @override
  List<Object?> get props => [
        imageFromCamera,
        imageFromGallery,
        imageAsString,
        fileFromDevice,
      ];
}
