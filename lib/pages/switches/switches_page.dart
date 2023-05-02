import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/data/app_prefs.dart';

class SwitchesPage extends ConsumerWidget {
  const SwitchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Text(
            ref.watch(balanceProvider).toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
