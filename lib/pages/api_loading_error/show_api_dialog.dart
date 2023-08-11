import 'package:flutter/material.dart';

void showApiDialog({
  required BuildContext context,
  required String actionText,
  required String title,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.grey.shade400,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(actionText),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(title),
            ),
          ],
        ),
      );
    },
  );
}
