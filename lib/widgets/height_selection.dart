import 'package:flutter/material.dart';

class HeightSelection extends StatelessWidget {
  final double height;
  final Function(double) onHeightChanged;

  const HeightSelection(
      {super.key, required this.height, required this.onHeightChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Height',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${height.toStringAsFixed(0)} cm',
                style: const TextStyle(fontSize: 22)),
          ],
        ),
        Slider(
          value: height,
          min: 100,
          max: 220,
          onChanged: onHeightChanged,
        ),
      ],
    );
  }
}
