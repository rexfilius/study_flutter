import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flutter/future_provider/suggestion.dart';

final suggestionServiceProvider =
    Provider<SuggestionService>((ref) => SuggestionService());

class SuggestionService {
  Future<Suggestion> getSuggestion() async {
    try {
      final res = await Dio().get('https://www.boredapi.com/api/activity');
      return Suggestion.fromJson(res.data);
    } catch (e) {
      throw Exception('Error getting suggestion');
    }
  }
}
