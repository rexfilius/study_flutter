import 'dart:io';

import 'package:equatable/equatable.dart';

class HomeScreenState extends Equatable {
  final File? imageFromCamera;
  final File? imageFromGallery;
  final String imageAsString;

  const HomeScreenState({
    required this.imageFromCamera,
    required this.imageFromGallery,
    required this.imageAsString,
  });

  HomeScreenState copyWith({
    File? imageFromCamera,
    File? imageFromGallery,
    String? imageAsString,
  }) {
    return HomeScreenState(
      imageFromCamera: imageFromCamera ?? this.imageFromCamera,
      imageFromGallery: imageFromGallery ?? this.imageFromGallery,
      imageAsString: imageAsString ?? this.imageAsString,
    );
  }

  @override
  List<Object?> get props => [imageFromCamera, imageFromGallery, imageAsString];
}
