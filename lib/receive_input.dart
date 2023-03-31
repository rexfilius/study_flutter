import 'package:flutter/material.dart';

class ReceiveInput extends StatelessWidget {
  const ReceiveInput({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '$args',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
