import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/quiz_model.dart';

class QuizService {
  Future<List<QuizQuestion>> fetchQuizQuestions(String theme, String language, int difficulty) async {
    try {
      final String response = await rootBundle.loadString('assets/quizzes/$theme/$language/questions.json');
      final data = json.decode(response);

      String difficultyKey;

      switch (difficulty) {
        case 1:
          difficultyKey = 'Beginner';
          break;
        case 2:
          difficultyKey = 'Confirmed';
          break;
        case 3:
          difficultyKey = 'Expert';
          break;
        default:
          difficultyKey = 'Beginner';
      }

      return (data[difficultyKey] as List).map((item) => QuizQuestion.fromJson(item)).toList();
    } catch (e) {
      print("Error loading quiz questions: $e");
      throw Exception('Failed to load quiz questions');
    }
  }
}
