import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputView extends StatelessWidget {
  const CustomInputView({
    super.key,
    this.downButtonPressed,
    this.upButtonPressed,
    this.doneButtonPressed,
  });

  final VoidCallback? downButtonPressed;
  final VoidCallback? upButtonPressed;
  final VoidCallback? doneButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: CupertinoColors.extraLightBackgroundGray,
      height: 45,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Theme(
                data: ThemeData(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoButton(
                      onPressed: upButtonPressed,
                      child: Transform.rotate(
                        angle: -pi / 2,
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: downButtonPressed,
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                padding: const EdgeInsets.only(
                  right: 24.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                onPressed: () {
                  if (doneButtonPressed != null) {
                    doneButtonPressed?.call();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                  Scrollable.ensureVisible(context,
                      alignment: 0, duration: const Duration(seconds: 1));
                },
                child: const Text(
                  "Done",
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
