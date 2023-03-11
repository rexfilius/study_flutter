import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// this value is provided globally
/// Provider provides a read-only value
final valueProvider = Provider<int>((ref) => 42);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(
          "The value is ${ref.watch(valueProvider)}",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
