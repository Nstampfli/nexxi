import 'package:flutter/material.dart';
import '../widgets/profile_component.dart';
import '../widgets/stats_component.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF151729),
        elevation: 0,
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ProfileComponent(),
          StatsComponent(),
        ],
      ),
    );
  }
}
