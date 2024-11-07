import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  final Function(String) onGenderSelected;

  const GenderSelection({super.key, required this.onGenderSelected});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String selectedGender = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onGenderSelected(gender);
  }

  Widget buildGenderCard(String gender, IconData icon) {
    bool isSelected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () => selectGender(gender),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? (gender == 'Male' ? Colors.blueAccent : Colors.pinkAccent)
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: isSelected ? Colors.black : Colors.transparent,
                width: 2),
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,
                  size: 50, color: isSelected ? Colors.white : Colors.black),
              const SizedBox(height: 10),
              Text(
                gender,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildGenderCard('Male', Icons.male),
        buildGenderCard('Female', Icons.female),
      ],
    );
  }
}
