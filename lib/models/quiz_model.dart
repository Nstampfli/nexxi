class QuizQuestion {
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final String anecdote;

  QuizQuestion({
    required this.question,
    required this.correctAnswer,
    required this.choices,
    required this.anecdote,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question: json['question'],
      correctAnswer: json['correctAnswer'],
      choices: List<String>.from(json['choices']),
      anecdote: json['anecdote'],
    );
  }
}

class QuizTheme {
  final String name;
  final String value;
  final String color;
  final String? tag;

  QuizTheme({required this.name, required this.value, required this.color, this.tag});
}

