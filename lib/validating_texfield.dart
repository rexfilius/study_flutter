import 'package:flutter/material.dart';

class ValidatingTextField extends StatelessWidget {
  const ValidatingTextField({
    super.key,
    required this.outerTitle,
    required this.controller,
    this.validator,
    this.errorText,
  });

  final String outerTitle;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 8.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            outerTitle,
            style: const TextStyle(color: Colors.deepPurple),
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              fillColor: Colors.grey,
              filled: true,
              errorText: errorText,
              errorStyle: const TextStyle(color: Colors.red),
              focusedBorder: customInputBorder,
              enabledBorder: customInputBorder,
              border: customInputBorder,
            ),
          )
        ],
      ),
    );
  }
}

final customInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(
    color: Colors.grey,
  ),
);
