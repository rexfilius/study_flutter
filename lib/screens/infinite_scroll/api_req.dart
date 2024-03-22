import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/infinite_scroll/beer.dart';

final paginatorProvider =
    AsyncNotifierProvider<PaginatorController, List<Beer>>(
        PaginatorController.new);

class PaginatorController extends AsyncNotifier<List<Beer>> {
  final dio = Dio();
  // https://punkapi.com/documentation/v2
  static const _url = "https://api.punkapi.com/v2/beers?";

  @override
  FutureOr<List<Beer>> build() async {
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(_fetchBeers);
    state = newState;
    return newState.value ?? [];
  }

  Future<void> fetchMore() async {
    final hasMore = ref.watch(hasMoreProvider);
    if (state.isLoading || !hasMore) return;
    state = const AsyncLoading();
    ref.read(pageProvider.notifier).state++;
    //
    final newState = await AsyncValue.guard(() async {
      var newList = await _fetchBeers();
      if (newList.isEmpty) {
        ref.read(hasMoreProvider.notifier).state = false;
      }
      return [...?state.value, ...newList];
    });
    state = newState;
  }

  Future<List<Beer>> _fetchBeers() async {
    final page = ref.watch(pageProvider);
    final response = await dio.get(_url, queryParameters: {"page": "$page"});
    final beerList = List.from(response.data).map((e) => Beer.fromJson(e));
    globalBeerList = [...globalBeerList, ...beerList];
    return beerList.toList();
  }
}

var globalBeerList = <Beer>[];
final hasMoreProvider = StateProvider<bool>((ref) => true);
final pageProvider = StateProvider<int>((ref) => 1);
