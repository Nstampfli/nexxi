import 'package:flutter/material.dart';
import '../widgets/leaderboard_list.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xFF151729),
        elevation: 0,
        title: Text("Leaderboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LeaderboardList(),
      ),
    );
  }
}
