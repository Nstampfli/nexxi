import 'package:flutter/material.dart';
import '../utils/fake_data.dart';
import 'quiz_config_page.dart';

class ThemeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sépare les thèmes avec et sans tag
    final availableThemes = FakeData.quizThemes.where((theme) => theme.tag == null).toList();
    final comingSoonThemes = FakeData.quizThemes.where((theme) => theme.tag == 'coming soon').toList();

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
        itemCount: availableThemes.length + comingSoonThemes.length,
        itemBuilder: (context, index) {
          final isComingSoon = index >= availableThemes.length;
          final theme = isComingSoon ? comingSoonThemes[index - availableThemes.length] : availableThemes[index];
          final isDisabled = theme.tag == 'coming soon';

          return GestureDetector(
            onTap: isDisabled
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizConfigPage(theme: theme),
                      ),
                    );
                  },
            child: Card(
              color: Color(0xFF1E2237),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Opacity(
                opacity: isDisabled ? 0.5 : 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(int.parse(theme.color)).withOpacity(0.1),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
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
                          if (isDisabled)
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Coming Soon',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      ),
                    ],
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