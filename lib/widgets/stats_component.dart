import 'package:flutter/material.dart';
import '../utils/fake_data.dart';
import 'stat_card.dart';

class StatsComponent extends StatefulWidget {
  @override
  _StatsComponentState createState() => _StatsComponentState();
}

class _StatsComponentState extends State<StatsComponent> with SingleTickerProviderStateMixin {
  String _selectedTheme = 'Overview';

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  void _updateTheme(String theme) {
    setState(() {
      _selectedTheme = theme;
      _animationController.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stats = FakeData.userProfile['stats'];
    final themes = stats['themes'] as Map<String, dynamic>;

    List<String> themeKeys = ['Overview', ...themes.keys];
    List<DropdownMenuItem<String>> dropdownItems = themeKeys.map((theme) {
      return DropdownMenuItem<String>(
        value: theme,
        child: Text(
          theme,
          style: TextStyle(color: Colors.white),
        ),
      );
    }).toList();

    List<Widget> displayedStats;
    if (_selectedTheme == 'Overview') {
      displayedStats = [
        StatCard(title: "Quizzes Taken", value: stats['quizzesTaken'].toString(), color: Colors.blue),
        StatCard(title: "Correct Answers", value: stats['correctAnswers'].toString(), color: Colors.green),
        StatCard(title: "Total Points", value: stats['totalPoints'].toString(), color: Colors.red),
        StatCard(title: "Highest Score", value: stats['highestScore'].toString(), color: Colors.purple),
        StatCard(title: "Average Score", value: stats['averageScore'].toString(), color: Colors.orange),
        StatCard(title: "Overall Accuracy", value: stats['overallAccuracy'], color: Colors.pink),
        StatCard(title: "Average Time per Quiz", value: stats['averageTimePerQuiz'], color: Colors.white),
      ];
    } else {
      final themeStats = themes[_selectedTheme];
      displayedStats = [
        StatCard(title: "Quizzes Taken", value: themeStats['quizzesTaken'].toString(), color: Colors.blueAccent),
        StatCard(title: "Correct Answers", value: themeStats['correctAnswers'].toString(), color: Colors.greenAccent),
        StatCard(title: "Accuracy", value: themeStats['accuracy'], color: Colors.purpleAccent),
        StatCard(title: "Average Time", value: themeStats['averageTime'], color: Colors.orangeAccent),
      ];
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Statistics",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(height: 16),
          DropdownButton<String>(
            value: _selectedTheme,
            dropdownColor: Color(0xFF1E2237),
            items: dropdownItems,
            onChanged: (String? newValue) {
              if (newValue != null) {
                _updateTheme(newValue);
              }
            },
            isExpanded: true,
            underline: Container(
              height: 2,
              color: Colors.amber,
            ),
          ),
          SizedBox(height: 16),
          FadeTransition(
            opacity: _animation,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),  // Désactiver le défilement indépendant
              itemCount: displayedStats.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return displayedStats[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
