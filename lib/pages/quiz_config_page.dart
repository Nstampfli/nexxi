import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/quiz_model.dart';
import 'quiz_page.dart';

class QuizConfigPage extends StatefulWidget {
  final QuizTheme theme;

  QuizConfigPage({required this.theme});

  @override
  _QuizConfigPageState createState() => _QuizConfigPageState();
}

class _QuizConfigPageState extends State<QuizConfigPage> {
  int _numQuestions = 10;
  String _language = 'en';
  int _difficulty = 2;
  bool _isTimed = false;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController(text: '8');
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Configuration'),
        backgroundColor: Color(0xFF151729),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Card(
          color: Color(0xFF1E2237),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.theme.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse(widget.theme.color)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildDropdownCard(
                  title: 'Number of Questions:',
                  child: DropdownButtonFormField<int>(
                    value: _numQuestions,
                    dropdownColor: Color(0xFF151729),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),
                    onChanged: (value) => setState(() => _numQuestions = value ?? 10),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.amber),
                    items: [5, 10, 15, 20].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value'),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                _buildDropdownCard(
                  title: 'Language:',
                  child: DropdownButtonFormField<String>(
                    value: _language,
                    dropdownColor: Color(0xFF151729),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),
                    onChanged: (value) => setState(() => _language = value ?? 'en'),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.amber),
                    items: [
                      DropdownMenuItem<String>(value: 'en', child: Text('English')),
                      DropdownMenuItem<String>(value: 'fr', child: Text('French')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildDropdownCard(
                  title: 'Difficulty:',
                  child: DropdownButtonFormField<int>(
                    value: _difficulty,
                    dropdownColor: Color(0xFF151729),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),
                    onChanged: (value) => setState(() => _difficulty = value ?? 2),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.amber),
                    items: [
                      DropdownMenuItem<int>(value: 1, child: Text('Beginner')),
                      DropdownMenuItem<int>(value: 2, child: Text('Confirmed')),
                      DropdownMenuItem<int>(value: 3, child: Text('Expert')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildTimerCard(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(
                            theme: widget.theme,
                            numQuestions: _numQuestions,
                            language: _language,
                            difficulty: _difficulty,
                            isTimed: _isTimed,
                            timePerQuestion: int.tryParse(_timeController.text) ?? 8,
                          ),
                        ),
                      );
                    },
                    child: Text('Start Quiz'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownCard({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFF2C2F48),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildTimerCard() {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFF2C2F48),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Timer:', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Spacer(),
              Switch(
                value: _isTimed,
                onChanged: (value) {
                  setState(() {
                    _isTimed = value;
                    if (_isTimed) {
                      _timeController.text = '8';
                    } else {
                      _timeController.text = '';
                    }
                  });
                },
              ),
            ],
          ),
          if (_isTimed)
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                width: double.infinity,
                child: TextField(
                  controller: _timeController,
                  decoration: InputDecoration(
                    labelText: 'Time per Question (s)',
                    filled: false,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              ),
            ),
        ],
      ),
    );
  }
}
