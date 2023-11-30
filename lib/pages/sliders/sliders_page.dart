import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlidersPage extends ConsumerStatefulWidget {
  const SlidersPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SlidersPageState();
}

class _SlidersPageState extends ConsumerState<SlidersPage> {
  final stringList = ['60', '90', '180', '270', '360'];
  double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            Slider(
              value: sliderValue,
              max: (stringList.length - 1).toDouble(),
              divisions: stringList.length - 1,
              label: '${stringList[sliderValue.round()]} days',
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
                //print(stringList[sliderValue.round()]);
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                '${stringList[sliderValue.round()]} days'.monthString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// DISABLED SLIDER WIDGET
// Slider(
//   value: durationSliderValue,
//   max: (durationList.length - 1).toDouble(),
//   divisions: durationList.length,
//   label: durationSliderValue.round().toString(),
//   onChanged: null,
// ),

extension Splitter on String {
  String monthString() {
    final splitt = split(' ');
    final string1 = splitt[0];

    final parse1 = int.parse(string1);
    final div1 = parse1 ~/ 30;

    return '$div1 months';
  }
}
