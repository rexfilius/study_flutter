import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/progress_indicator/circular_gradient_spinner.dart';

class ProgressIndicatorPage extends ConsumerStatefulWidget {
  const ProgressIndicatorPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends ConsumerState<ProgressIndicatorPage> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient Spinner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showSpinner
              ? const CircularGradientSpinner(
                  color: Colors.brown,
                  size: 200,
                  strokeWidth: 20,
                )
              : Container(),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              setState(() {
                showSpinner = !showSpinner;
              });
            },
            child: const Text('Show Spinner'),
          ),
        ],
      ),
    );
  }
}
