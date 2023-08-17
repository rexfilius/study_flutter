import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LastNameTextField extends HookConsumerWidget {
  const LastNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    return TextField(
      controller: textController,
      onChanged: (value) {
        ref.read(lastNameProvider.notifier).state = value;
      },
    );
  }
}

final lastNameProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});
