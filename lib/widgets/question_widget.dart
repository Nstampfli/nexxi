import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class QuestionWidget extends StatelessWidget {
  final int questionIndex;
  final QuizQuestion question;

  QuestionWidget({required this.questionIndex, required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Question ${questionIndex + 1}:',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            question.question,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
