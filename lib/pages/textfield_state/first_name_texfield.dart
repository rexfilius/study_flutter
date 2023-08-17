import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirstNameTextField extends HookConsumerWidget {
  const FirstNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    return TextField(
      controller: textController,
      onChanged: (value) {
        ref.read(firstNameProvider.notifier).state = value;
      },
    );
  }
}

final firstNameProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});
