import 'package:flutter/material.dart' show immutable;
import 'package:study_flutter/models/person.dart';
import 'package:study_flutter/util/extension.dart';

@immutable
class FetchResult {
  final Iterable<Person> persons;
  final bool isRetrievedFromCache;

  const FetchResult({
    required this.persons,
    required this.isRetrievedFromCache,
  });

  @override
  bool operator ==(covariant FetchResult other) {
    return persons.isEqualIgnoringOrdering(other.persons) &&
        isRetrievedFromCache == other.isRetrievedFromCache;
  }

  @override
  int get hashCode => Object.hash(persons, isRetrievedFromCache);

  @override
  String toString() {
    return "FetchResult(isRetrievedFromCache: $isRetrievedFromCache, persons: $persons)";
  }
}
