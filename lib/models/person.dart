import 'dart:convert';

import 'package:flutter/material.dart' show immutable;
import 'dart:io';

@immutable
class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;
}

Future<Iterable<Person>> getPersons(String url) {
  return HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((resp) => resp.transform(utf8.decoder).join())
      .then((str) => json.decode(str) as List<dynamic>)
      .then((list) => list.map((e) => Person.fromJson(e)));
}
