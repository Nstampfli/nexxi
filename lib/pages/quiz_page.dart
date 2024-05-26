import 'package:flutter/material.dart';
import 'dart:async';
import '../services/quiz_service.dart';
import '../models/quiz_model.dart';
import 'result_page.dart';
import '../widgets/question_widget.dart';
import '../widgets/choices_widget.dart';
import '../widgets/result_dialog.dart';

class QuizPage extends StatefulWidget {
  final QuizTheme theme;
  final int numQuestions;
  final String language;
  final int difficulty;
  final bool isTimed;
  final int timePerQuestion;

  QuizPage({
    required this.theme,
    required this.numQuestions,
    required this.language,
    required this.difficulty,
    required this.isTimed,
    required this.timePerQuestion,
  });

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with SingleTickerProviderStateMixin {
  late Future<List<QuizQuestion>> _quizQuestions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isAnswered = false;
  bool _isCorrect = false;
  String _selectedAnswer = '';
  late double _timeLeft;
  Timer? _timer;
  late AnimationController _controller;
  List<String> _shuffledChoices = [];
  List<double> _responseTimes = [];
  DateTime? _questionStartTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.timePerQuestion),
    );
    _loadQuizQuestions();
    _timeLeft = widget.timePerQuestion.toDouble();
    if (widget.isTimed) {
      _startTimer();
    }
    _questionStartTime = DateTime.now(); // Initialize the start time for the first question
  }

  void _loadQuizQuestions() {
    _quizQuestions = QuizService().fetchQuizQuestions(
      widget.theme.name,
      widget.language,
      widget.difficulty,
    );
  }

  void _startTimer() {
    _controller.forward(from: 0);
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft -= 0.1;
        } else {
          _timer?.cancel();
          _handleAnswer('');
        }
      });
    });
  }

  void _handleAnswer(String answer) async {
    if (_isAnswered) return;

    List<QuizQuestion> questions = await _quizQuestions;

    setState(() {
      _isAnswered = true;
      _selectedAnswer = answer;
      _isCorrect = answer.isNotEmpty && questions[_currentQuestionIndex].correctAnswer == answer;
      if (_isCorrect) {
        _score++;
      }
      if (widget.isTimed) {
        _timer?.cancel();
      }
      if (_questionStartTime != null) {
        _responseTimes.add(DateTime.now().difference(_questionStartTime!).inSeconds.toDouble());
      }
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ResultDialog(
          isCorrect: _isCorrect,
          question: questions[_currentQuestionIndex],
          onNext: () {
            Navigator.of(context).pop();
            _loadNextQuestion();
          },
          isLastQuestion: _currentQuestionIndex == widget.numQuestions - 1,
        );
      },
    );
  }

  void _loadNextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      if (_currentQuestionIndex >= widget.numQuestions) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              score: _score,
              total: widget.numQuestions,
              successRate: (_score / widget.numQuestions) * 100,
              averageTime: _responseTimes.isNotEmpty
                  ? _responseTimes.reduce((a, b) => a + b) / _responseTimes.length
                  : 0,
              fastAnswers: _responseTimes.where((time) => time < 5).length,
            ),
          ),
        );
      } else {
        _isAnswered = false;
        _selectedAnswer = '';
        _timeLeft = widget.timePerQuestion.toDouble();
        _controller.reset();
        if (widget.isTimed) {
          _startTimer();
        }
        _shuffleChoices();
        _questionStartTime = DateTime.now(); // Reset start time for the next question
      }
    });
  }

  void _shuffleChoices() async {
    List<QuizQuestion> questions = await _quizQuestions;
    setState(() {
      _shuffledChoices = List.from(questions[_currentQuestionIndex].choices);
      _shuffledChoices.shuffle();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question ${_currentQuestionIndex + 1} / ${widget.numQuestions}',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF151729),
      ),
      body: FutureBuilder<List<QuizQuestion>>(
        future: _quizQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load quiz questions: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No questions available'));
          } else {
            var question = snapshot.data![_currentQuestionIndex];
            if (_shuffledChoices.isEmpty) {
              _shuffledChoices = List.from(question.choices);
              _shuffledChoices.shuffle();
            }
            _questionStartTime ??= DateTime.now(); // Initialize start time if null
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.isTimed)
                    LinearProgressIndicator(
                      value: _controller.value,
                      color: Colors.amber,
                      backgroundColor: Colors.grey,
                    ),
                  QuestionWidget(
                    questionIndex: _currentQuestionIndex,
                    question: question,
                  ),
                  ChoicesWidget(
                    choices: _shuffledChoices,
                    onChoiceSelected: _handleAnswer,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
