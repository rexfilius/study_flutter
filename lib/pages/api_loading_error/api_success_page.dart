import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApiSuccessPage extends HookConsumerWidget {
  const ApiSuccessPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'The API call was succesful',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
