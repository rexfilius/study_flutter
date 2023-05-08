import 'package:flutter/material.dart';
import 'package:study_flutter/pages/home/components/dice_roller.dart';

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
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
