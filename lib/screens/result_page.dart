import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String gender;

  const ResultPage({super.key, required this.bmi, required this.gender});

  String getBmiClassification() {
    if (gender == 'Female') {
      if (bmi < 17) return 'Underweight';
      if (bmi >= 17 && bmi < 23) return 'Normal';
      if (bmi >= 23 && bmi <= 27) return 'Overweight';
      return 'Obese';
    } else {
      if (bmi < 18) return 'Underweight';
      if (bmi >= 18 && bmi < 25) return 'Normal';
      if (bmi >= 25 && bmi <= 27) return 'Overweight';
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your BMI is', style: TextStyle(fontSize: 24)),
            Text(
              '${bmi.toStringAsFixed(1)} kg/m²',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(getBmiClassification(), style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('RE-CALCULATE'),
            ),
          ],
        ),
      ),
    );
  }
}
