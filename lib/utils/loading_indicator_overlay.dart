import 'package:flutter/material.dart';

class LoadingIndicatorOverlay extends StatelessWidget {
  const LoadingIndicatorOverlay({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (isLoading)
          ModalBarrier(
            color: const Color(0xff002766).withOpacity(0.2),
            dismissible: false,
          ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(strokeWidth: 2.0),
          )
      ],
    );
  }
}
