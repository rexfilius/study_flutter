import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flutter/models/suggestion.dart';
import 'package:study_flutter/service/api_service.dart';

final suggestionFutureProvider = FutureProvider.autoDispose<Suggestion>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Future Provider'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(suggestionFutureProvider.future),
        child: ListView(
          children: [
            suggestionRef.when(
              data: (data) {
                return Text(
                  data.activity,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              error: (error, stacktrace) {
                return Text(
                  error.toString(),
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
