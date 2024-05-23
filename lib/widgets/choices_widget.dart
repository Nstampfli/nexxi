import 'package:flutter/material.dart';

class ChoicesWidget extends StatelessWidget {
  final List<String> choices;
  final Function(String) onChoiceSelected;

  ChoicesWidget({required this.choices, required this.onChoiceSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: choices.map((choice) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: () => onChoiceSelected(choice),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text(choice),
            ),
          );
        }).toList(),
      ),
    );
  }
}
