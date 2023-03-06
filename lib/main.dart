import 'package:flutter/material.dart';
import 'package:study_flutter/bloc/person_bloc.dart';
import 'package:study_flutter/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PersonsBloc(),
        child: const HomePage(),
      ),
    );
  }
}
