import 'dart:convert';

import 'package:flutter/material.dart' show immutable;
import 'dart:io';

@immutable
class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  @override
  String toString() {
    return {
      "CLASS": "Todo",
      "userId": userId,
      "id": id,
      "title": title,
      "completed": completed,
    }.toString();
  }
}

Future<Iterable<Todo>> getTodos(String url) {
  return HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((resp) => resp.transform(utf8.decoder).join())
      .then((str) => json.decode(str) as List<dynamic>)
      .then((list) => list.map((e) => Todo.fromJson(e)));
}
