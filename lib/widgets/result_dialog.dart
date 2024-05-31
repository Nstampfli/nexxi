import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class ResultDialog extends StatelessWidget {
  final bool isCorrect;
  final QuizQuestion question;
  final VoidCallback onNext;
  final bool isLastQuestion;
  final String language;

  ResultDialog({
    required this.isCorrect,
    required this.question,
    required this.onNext,
    required this.isLastQuestion,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isCorrect ? (language == 'en' ? 'Correct Answer' : 'Bonne réponse') : (language == 'en' ? 'Incorrect Answer' : 'Mauvaise réponse'),
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Question :',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              question.question,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              language == 'en' ? 'Correct answer :' : 'Bonne réponse :',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              question.correctAnswer,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Anecdote :',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              question.anecdote,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  foregroundColor: isCorrect ? Colors.green : Colors.red, backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: Text(isLastQuestion ? (language == 'en' ? 'View Results' : 'Voir les résultats' )  : (language == 'en' ? 'Next Question' : 'Question suivante')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
