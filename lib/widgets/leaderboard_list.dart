import 'package:flutter/material.dart';
import '../utils/fake_data.dart';

class LeaderboardList extends StatefulWidget {
  const LeaderboardList({super.key});

  @override
  _LeaderboardListState createState() => _LeaderboardListState();
}

class _LeaderboardListState extends State<LeaderboardList> with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> _currentList = FakeData.leaderboardUsersRegion;
  String _selectedFilter = 'Region';
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

  void _updateList(String filter) {
    setState(() {
      _selectedFilter = filter;
      switch (filter) {
        case 'Region':
          _currentList = FakeData.leaderboardUsersRegion;
          break;
        case 'National':
          _currentList = FakeData.leaderboardUsersNational;
          break;
        case 'Global':
          _currentList = FakeData.leaderboardUsersGlobal;
          break;
      }
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
    // Trier les utilisateurs par score décroissant
    List<Map<String, dynamic>> sortedUsers = List.from(_currentList);
    sortedUsers.sort((a, b) => b['score'].compareTo(a['score']));

    return Column(
      children: [
        // Filtre en haut du leaderboard
        Container(
          constraints: BoxConstraints(maxWidth: 400), // Limite la largeur du conteneur des filtres
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFilterButton('Region'),
              _buildFilterButton('National'),
              _buildFilterButton('Global'),
            ],
          ),
        ),
        Expanded(
          child: FadeTransition(
            opacity: _animation,
            child: ListView(
              children: [
                // Afficher les trois premiers utilisateurs
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0, top: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTopUser(sortedUsers[1], 'Silver', Colors.grey, context, offset: Offset(-20, 0)),
                      _buildTopUser(sortedUsers[0], 'Gold', Colors.amber, context, scale: 1.2),
                      _buildTopUser(sortedUsers[2], 'Bronze', Colors.brown, context, offset: Offset(20, 0)),
                    ],
                  ),
                ),
                ...sortedUsers.sublist(3).asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> user = entry.value;
                  return _buildUserTile(user, index + 4);
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String text) {
    bool isSelected = _selectedFilter == text;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber : Color(0xFF1E2237),
        borderRadius: BorderRadius.circular(20),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.amber.withOpacity(0.5), spreadRadius: 3, blurRadius: 5)]
            : [],
      ),
      child: ElevatedButton(
        onPressed: () {
          _updateList(text);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTopUser(Map<String, dynamic> user, String rank, Color color, BuildContext context, {double scale = 1.0, Offset offset = Offset.zero}) {
    return Transform.translate(
      offset: offset,
      child: Transform.scale(
        scale: scale,
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: color,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(user['avatar']),
              ),
            ),
            SizedBox(height: 8),
            Text(
              user['name'],
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              user['username'],
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              user['score'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTile(Map<String, dynamic> user, int rank) {
    return Card(
      color: Color(0xFF1E2237), // Couleur de fond des cartes
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              user['change'] > 0
                  ? Icons.arrow_drop_up
                  : user['change'] < 0
                      ? Icons.arrow_drop_down
                      : Icons.horizontal_rule,
              color: user['change'] > 0
                  ? Colors.green
                  : user['change'] < 0
                      ? Colors.red
                      : Colors.amber, // Changer la couleur à amber si aucune place n'a été gagnée
            ),
            Text(
              '#$rank',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user['avatar']),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  user['username'],
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        trailing: Text(
          user['score'].toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
