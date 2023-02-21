import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:study_flutter/app.dart';
import 'package:study_flutter/counter_observer.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
