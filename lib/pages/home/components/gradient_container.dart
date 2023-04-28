import 'package:flutter/material.dart';
import 'package:study_flutter/pages/home/components/styled_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.colors,
  });

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Image.asset(
        'assets/images/dice-1.png',
        width: 200,
      ),
    );
  }
}
