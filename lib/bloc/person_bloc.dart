import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter/bloc/bloc_actions.dart';
import 'package:study_flutter/bloc/bloc_state.dart';
import 'package:study_flutter/models/person.dart';

class PersonsBloc extends Bloc<LoadAction, FetchPerson?> {
  final Map<String, Iterable<Person>> _cache = {};

  PersonsBloc() : super(null) {
    on<LoadPersonsAction>((event, emit) async {
      final url = event.url;
      if (_cache.containsKey(url)) {
        final cachedPersons = _cache[url]!;
        final result = FetchPerson(
          persons: cachedPersons,
          isFromCache: true,
        );
        emit(result);
      } else {
        final loader = event.loader;
        final persons = await loader(url);
        _cache[url] = persons;
        final result = FetchPerson(
          persons: persons,
          isFromCache: false,
        );
        emit(result);
      }
    });
  }
}
