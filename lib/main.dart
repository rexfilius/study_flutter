import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flutter/home_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.bigStone,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.mandyRed,
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
