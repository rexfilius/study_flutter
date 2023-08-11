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
  return const ApiResponse(
    data: 'data is Success',
    id: 200,
  );
  //throw 'Error has been thrown';
}

// ===============================================================

final loginUserApiProvider = AsyncNotifierProvider<LoginNotifier, String>(
  () => LoginNotifier(),
);

class LoginNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return '';
  }

  Future<void> login({
    required String name,
    required String surname,
  }) async {
    state = const AsyncValue.loading();
    try {
      final api = await loginUser(name: name, surname: surname);
      state = AsyncValue.data(api);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}

Future<String> loginUser({
  required String name,
  required String surname,
}) async {
  await Future.delayed(const Duration(seconds: 1));
  if (name != 'John' || surname != 'Doe') {
    throw 'Your details are incorrect';
  }
  return 'Login details correct';
}
