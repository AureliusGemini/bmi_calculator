import 'package:flutter/material.dart';

class WeightSelection extends StatelessWidget {
  final int weight;
  final Function(int) onWeightChanged;

  const WeightSelection({super.key, required this.weight, required this.onWeightChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Weight',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => onWeightChanged(weight - 1),
              icon: const Icon(Icons.remove_circle, color: Colors.red, size: 40),
            ),
            Text('$weight kg', style: const TextStyle(fontSize: 22)),
            IconButton(
              onPressed: () => onWeightChanged(weight + 1),
              icon: const Icon(Icons.add_circle, color: Colors.green, size: 40),
            ),
          ],
        ),
      ],
    );
  }
}
