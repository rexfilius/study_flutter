import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/textfield_state/first_name_texfield.dart';
import 'package:study_flutter/screens/textfield_state/last_name_textfield.dart';
import 'package:study_flutter/screens/textfield_state/monitor_text_field.dart';

class TextfieldStatePage extends ConsumerWidget {
  const TextfieldStatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstname = ref.watch(firstNameProvider);
    final lastName = ref.watch(lastNameProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            const FirstNameTextField(),
            const LastNameTextField(),
            const MonitorTextField(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
            Text('First name = $firstname & last name = $lastName'),
          ],
        ),
      ),
    );
  }
}
