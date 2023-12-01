import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonitorTextField extends StatefulHookConsumerWidget {
  const MonitorTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MonitorTextFieldState();
}

class _MonitorTextFieldState extends ConsumerState<MonitorTextField> {
  Timer? timer;

  void startTimer(String text) {
    timer = Timer(const Duration(milliseconds: 600), () {
      print('Typing finished: $text');
    });
  }

  void resetTimer(String text) {
    timer?.cancel();
    startTimer(text);
  }

  // void _onTypingFinished(String text) {
  //   // if (timer != null) {
  //   //   timer!.cancel();
  //   // }
  //   final timer = Timer(Duration(milliseconds: 2000), () {
  //     // Call your callback function here
  //     print('Typing finished: $text');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return TextField(
      controller: textController,
      onSubmitted: (value) {
        debugPrint('user is done typing ==> $value');
      },
      onEditingComplete: () {
        debugPrint('user is done editing');
      },
      onChanged: resetTimer,
    );
  }
}
