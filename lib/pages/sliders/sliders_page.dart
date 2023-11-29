import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlidersPage extends ConsumerStatefulWidget {
  const SlidersPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SlidersPageState();
}

class _SlidersPageState extends ConsumerState<SlidersPage> {
  final durationList = ['60', '90', '180', '270', '360'];
  double durationSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            Slider(
              value: durationSliderValue,
              max: (durationList.length - 1).toDouble(),
              divisions: durationList.length,
              label: durationSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  durationSliderValue = value;
                });
              },
            ),
            // Text(
            //   'Index: ${durationSliderValue.round()}',
            //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            // ),
            Chip(
              avatar: const CircleAvatar(backgroundColor: Colors.purple),
              label: Text(
                '${durationList[durationSliderValue.round()]} days',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Slider(
              value: durationSliderValue,
              max: (durationList.length - 1).toDouble(),
              divisions: durationList.length,
              label: durationSliderValue.round().toString(),
              onChanged: null,
            ),
          ],
        ),
      ),
    );
  }
}
