import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/keyboard2/custom_textfield.dart';

class KeyboardPage2 extends ConsumerStatefulWidget {
  const KeyboardPage2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KeyboardPage2State();
}

class _KeyboardPage2State extends ConsumerState<KeyboardPage2> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          CustomTextField(
            controller: controller1,
            inputType: TextInputType.name,
            outerTitle: "TextInputType - name",
            showOuterTile: true,
          ),
          CustomTextField(
            controller: controller2,
            inputType: TextInputType.number,
            outerTitle: "TextInputType - number",
            showOuterTile: true,
          ),
        ],
      ),
    );
  }
}
