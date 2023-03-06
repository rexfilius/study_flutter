import 'package:flutter/material.dart' show immutable;
import 'package:study_flutter/models/person.dart';

@immutable
class FetchResult {
  final Iterable<Person> persons;
  final bool isRetrievedFromCache;

  const FetchResult({
    required this.persons,
    required this.isRetrievedFromCache,
  });

  @override
  String toString() {
    return "FetchResult(isRetrievedFromCache: $isRetrievedFromCache, persons: $persons)";
  }
}
