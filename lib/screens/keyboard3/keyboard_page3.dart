import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/keyboard3/input_pin_widget.dart';

class KeyboardPage3 extends ConsumerWidget {
  const KeyboardPage3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PIN Keyboard'),
      ),
      body: Column(
        children: [
          const Text('Input PIN'),
          const SizedBox(height: 10),
          InputPinWidget(
            onPinEntered: (String value) {},
          ),
          //Expanded(child: Container()),
        ],
      ),
    );
  }
}
