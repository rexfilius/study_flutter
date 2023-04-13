import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flutter/app_prefs.dart';

class SwitchesPage extends ConsumerStatefulWidget {
  const SwitchesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SwitchesPageState();
}

class _SwitchesPageState extends ConsumerState<SwitchesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            value: ref.watch(balanceProvider),
            onChanged: (bool value) {
              ref.read(balanceProvider.notifier).state = value;
            },
          ),
          Text(ref.watch(balanceProvider).toString()),
        ],
      ),
    );
  }
}
