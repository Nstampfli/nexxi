import 'package:flutter/material.dart';

class ChoicesWidget extends StatelessWidget {
  final List<String> choices;
  final Function(String) onChoiceSelected;

  ChoicesWidget({required this.choices, required this.onChoiceSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: choices.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () => onChoiceSelected(choices[index]),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              shadowColor: Colors.black.withOpacity(0.3),
            ),
            child: Text(
              choices[index],
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
