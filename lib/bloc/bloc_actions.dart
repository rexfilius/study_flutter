import 'package:flutter/material.dart';
import 'package:study_flutter/models/person.dart';
import 'package:study_flutter/models/post.dart';
import 'package:study_flutter/models/todo.dart';

typedef PersonsLoader = Future<Iterable<Person>> Function(String url);
typedef TodosLoader = Future<Iterable<Todo>> Function(String url);
typedef PostsLoader = Future<Iterable<Post>> Function(String url);

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction implements LoadAction {
  final String url;
  final PersonsLoader loader;

  const LoadPersonsAction({
    required this.url,
    required this.loader,
  }) : super();
}

@immutable
class LoadTodosAction implements LoadAction {
  final String url;
  final TodosLoader loader;

  const LoadTodosAction({
    required this.url,
    required this.loader,
  }) : super();
}

@immutable
class LoadPostsAction implements LoadAction {
  final String url;
  final PostsLoader loader;

  const LoadPostsAction({
    required this.url,
    required this.loader,
  }) : super();
}
