import 'package:flutter/material.dart';
import 'package:study_flutter/util/extension.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction implements LoadAction {
  final PersonUrl url;

  const LoadPersonsAction({required this.url}) : super();
}
