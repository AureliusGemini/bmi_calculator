import 'package:flutter/material.dart';
import '../widgets/gender_selection.dart';
import '../widgets/height_selection.dart';
import '../widgets/weight_selection.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedGender = '';
  double height = 156;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Column(
        children: [
          GenderSelection(
            onGenderSelected: (gender) =>
                setState(() => selectedGender = gender),
          ),
          HeightSelection(
            height: height,
            onHeightChanged: (newHeight) => setState(() => height = newHeight),
          ),
          WeightSelection(
            weight: weight,
            onWeightChanged: (newWeight) => setState(() => weight = newWeight),
          ),
          ElevatedButton(
            onPressed: () {
              double bmi = weight / ((height / 100) * (height / 100));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ResultPage(bmi: bmi, gender: selectedGender),
                ),
              );
            },
            child: const Text('CALCULATE'),
          ),
        ],
      ),
    );
  }
}
