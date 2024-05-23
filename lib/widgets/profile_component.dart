import 'package:flutter/material.dart';
import '../utils/fake_data.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfile = FakeData.userProfile;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(userProfile['avatar'] ?? 'https://via.placeholder.com/100'),
          ),
          SizedBox(height: 16),
          Text(
            userProfile['name'],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            userProfile['username'],
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          SizedBox(height: 8),
          Text(
            userProfile['email'],
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          SizedBox(height: 24),
          Divider(color: Colors.white54),
          SizedBox(height: 24),
          ProfileDetail(title: "Location", value: userProfile['location'] ?? "Unknown"),
          ProfileDetail(title: "Joined", value: userProfile['joined'] ?? "Unknown"),
        ],
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String title;
  final String value;

  ProfileDetail({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.white70),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
