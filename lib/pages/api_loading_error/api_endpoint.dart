import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/pages/api_loading_error/api_model.dart';

final apiNotifierProvider =
    AsyncNotifierProvider<ApiNotifier, ApiResponse>(ApiNotifier.new);

class ApiNotifier extends AsyncNotifier<ApiResponse> {
  @override
  FutureOr<ApiResponse> build() {
    return const ApiResponse.empty();
  }

  Future<void> callApi() async {
    state = const AsyncValue.loading();
    try {
      final apiData = await getApiResponse();
      state = AsyncValue.data(apiData);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}

Future<ApiResponse> getApiResponse() async {
  await Future.delayed(const Duration(seconds: 2));
  // return const ApiResponse(
  //   data: 'data is Success',
  //   id: 200,
  // );
  throw 'Error has been thrown';
}
