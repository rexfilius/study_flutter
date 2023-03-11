import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flutter/stream_provider/stream_service.dart';

final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamValueProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
      ),
      body: Center(
        child: streamValue.when(
          data: (data) {
            return Text(
              data.toString(),
              style: const TextStyle(fontSize: 30),
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
