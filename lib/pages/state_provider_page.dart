import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueStateProvider = StateProvider<int>((ref) => 50);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);

    /// you use ref.listen to listen to changes, peradventure you need
    /// it in a dialog or snackbar or any form of popup
    ref.listen(valueStateProvider, (previous, current) {
      if (current == 65) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Value is $current'),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'The value is $value',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(valueStateProvider.notifier).state++;
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                /// instead of calling the invalidate function
                /// you can declare the provider as StateProvider.autoDispose
                ref.invalidate(valueStateProvider);
              },
              child: const Text('Invalidate'),
            ),
          ],
        ),
      ),
    );
  }
}
