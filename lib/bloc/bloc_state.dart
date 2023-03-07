import 'package:flutter/material.dart' show immutable;
import 'package:study_flutter/models/person.dart';
import 'package:study_flutter/models/post.dart';
import 'package:study_flutter/models/todo.dart';
import 'package:study_flutter/util/extension.dart';

@immutable
class FetchPerson {
  final Iterable<Person> persons;
  final bool isFromCache;

  const FetchPerson({
    required this.persons,
    required this.isFromCache,
  });

  @override
  bool operator ==(covariant FetchPerson other) {
    return persons.isEqualIgnoringOrdering(other.persons) &&
        isFromCache == other.isFromCache;
  }

  @override
  int get hashCode => Object.hash(persons, isFromCache);

  @override
  String toString() {
    return "FetchResult(isFromCache: $isFromCache, persons: $persons)";
  }
}

@immutable
class FetchTodo {
  final Iterable<Todo> todos;
  final bool isFromCache;

  const FetchTodo({
    required this.todos,
    required this.isFromCache,
  });

  @override
  bool operator ==(covariant FetchTodo other) {
    return todos.isEqualIgnoringOrdering(other.todos) &&
        isFromCache == other.isFromCache;
  }

  @override
  int get hashCode => Object.hash(todos, isFromCache);

  @override
  String toString() {
    return "FetchTodo(isFromCache: $isFromCache, todos: $todos)";
  }
}

@immutable
class FetchPost {
  final Iterable<Post> posts;
  final bool isFromCache;

  const FetchPost({
    required this.posts,
    required this.isFromCache,
  });

  @override
  bool operator ==(covariant FetchPost other) {
    return posts.isEqualIgnoringOrdering(other.posts) &&
        isFromCache == other.isFromCache;
  }

  @override
  int get hashCode => Object.hash(posts, isFromCache);

  @override
  String toString() {
    return "FetchTodo(isFromCache: $isFromCache, posts: $posts)";
  }
}
