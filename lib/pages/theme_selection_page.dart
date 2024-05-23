import 'package:flutter/material.dart';
import '../utils/fake_data.dart';
import 'quiz_config_page.dart';

class ThemeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Theme'),
        backgroundColor: Color(0xFF151729),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: FakeData.quizThemes.length,
        itemBuilder: (context, index) {
          final theme = FakeData.quizThemes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizConfigPage(theme: theme),
                ),
              );
            },
            child: Card(
              color: Color(0xFF1E2237), // Couleur de fond d'origine
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(int.parse(theme.color)).withOpacity(0.1),
                      blurRadius: 100,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    theme.name,
                    style: TextStyle(
                      color: Color(int.parse(theme.color)),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
