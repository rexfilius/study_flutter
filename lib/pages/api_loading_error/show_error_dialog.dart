import 'package:flutter/material.dart';

void shoWErrorDialog({
  required BuildContext context,
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
            child: const Text('Dismiss'),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Flexible(
              child: Text('An error occured'),
            ),
          ],
        ),
      );
    },
  );
}
