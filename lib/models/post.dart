import 'dart:convert';

import 'package:flutter/material.dart' show immutable;
import 'dart:io';

@immutable
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  @override
  String toString() {
    return {
      "CLASS": "Post",
      "userId": userId,
      "id": id,
      "title": title,
      "body": body,
    }.toString();
  }
}

Future<Iterable<Post>> getTodos(String url) {
  return HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((resp) => resp.transform(utf8.decoder).join())
      .then((str) => json.decode(str) as List<dynamic>)
      .then((list) => list.map((e) => Post.fromJson(e)));
}
