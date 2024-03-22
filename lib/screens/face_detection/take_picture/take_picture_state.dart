import 'dart:io';

import 'package:equatable/equatable.dart';

class TakePictureState extends Equatable {
  final File? imageFromDevice;
  final String? fileName;
  final String documentName;
  final String documentPath;
  final bool errorUploading;

  const TakePictureState({
    this.imageFromDevice,
    this.fileName,
    required this.documentName,
    required this.documentPath,
    required this.errorUploading,
  });

  TakePictureState copyWith({
    File? imageFromDevice,
    String? fileName,
    String? documentName,
    String? documentPath,
    bool? errorUploading,
  }) {
    return TakePictureState(
      imageFromDevice: imageFromDevice ?? this.imageFromDevice,
      fileName: fileName ?? this.fileName,
      documentName: documentName ?? this.documentName,
      documentPath: documentPath ?? this.documentPath,
      errorUploading: errorUploading ?? this.errorUploading,
    );
  }

  @override
  List<Object?> get props => [
        imageFromDevice,
        fileName,
        documentName,
        documentPath,
        errorUploading,
      ];
}
