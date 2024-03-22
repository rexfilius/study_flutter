import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

customError() {
  ErrorWidget.builder = (details) => Scaffold(
        appBar: AppBar(title: const Text('System Error')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Error",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              kDebugMode
                  ? details.exception.toString()
                  : "Oops! A system error occured",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      );
}
