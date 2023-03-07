import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter/bloc/bloc_actions.dart';
import 'package:study_flutter/bloc/bloc_state.dart';
import 'package:study_flutter/models/todo.dart';

class TodosBloc extends Bloc<LoadAction, FetchTodo?> {
  final Map<String, Iterable<Todo>> _cache = {};

  TodosBloc() : super(null) {}
}
