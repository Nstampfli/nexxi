import 'package:nexxi/models/quiz_model.dart';

class FakeData {
  static final List<Map<String, dynamic>> leaderboardUsersRegion = [
    {'name': 'Alice', 'score': 1234, 'avatar': 'https://randomuser.me/api/portraits/women/1.jpg', 'username': '@alice', 'change': 1},
    {'name': 'Bob', 'score': 931, 'avatar': 'https://randomuser.me/api/portraits/men/1.jpg', 'username': '@bob', 'change': -1},
    {'name': 'Charlie', 'score': 593, 'avatar': 'https://randomuser.me/api/portraits/men/2.jpg', 'username': '@charlie', 'change': 0},
    {'name': 'Dave', 'score': 592, 'avatar': 'https://randomuser.me/api/portraits/men/3.jpg', 'username': '@dave', 'change': 2},
    {'name': 'Eve', 'score': 1453, 'avatar': 'https://randomuser.me/api/portraits/women/2.jpg', 'username': '@eve', 'change': -2},
    {'name': 'Frank', 'score': 456, 'avatar': 'https://randomuser.me/api/portraits/men/4.jpg', 'username': '@frank', 'change': 1},
    {'name': 'Grace', 'score': 958, 'avatar': 'https://randomuser.me/api/portraits/women/3.jpg', 'username': '@grace', 'change': -1},
    {'name': 'Heidi', 'score': 732, 'avatar': 'https://randomuser.me/api/portraits/women/4.jpg', 'username': '@heidi', 'change': 1},
    {'name': 'Ivan', 'score': 901, 'avatar': 'https://randomuser.me/api/portraits/men/5.jpg', 'username': '@ivan', 'change': 0},
    {'name': 'Judy', 'score': 238, 'avatar': 'https://randomuser.me/api/portraits/women/5.jpg', 'username': '@judy', 'change': -3},
    {'name': 'Mallory', 'score': 1002, 'avatar': 'https://randomuser.me/api/portraits/women/6.jpg', 'username': '@mallory', 'change': 0},
    {'name': 'Niaj', 'score': 1321, 'avatar': 'https://randomuser.me/api/portraits/men/6.jpg', 'username': '@niaj', 'change': 2},
    {'name': 'Olivia', 'score': 1114, 'avatar': 'https://randomuser.me/api/portraits/women/7.jpg', 'username': '@olivia', 'change': -2},
    {'name': 'Peggy', 'score': 884, 'avatar': 'https://randomuser.me/api/portraits/women/8.jpg', 'username': '@peggy', 'change': 1},
    {'name': 'Quinn', 'score': 999, 'avatar': 'https://randomuser.me/api/portraits/men/7.jpg', 'username': '@quinn', 'change': -1},
    {'name': 'Rupert', 'score': 765, 'avatar': 'https://randomuser.me/api/portraits/men/8.jpg', 'username': '@rupert', 'change': 1},
    {'name': 'Sybil', 'score': 345, 'avatar': 'https://randomuser.me/api/portraits/women/9.jpg', 'username': '@sybil', 'change': -2},
    {'name': 'Trent', 'score': 754, 'avatar': 'https://randomuser.me/api/portraits/men/9.jpg', 'username': '@trent', 'change': 0},
    {'name': 'Uma', 'score': 777, 'avatar': 'https://randomuser.me/api/portraits/women/10.jpg', 'username': '@uma', 'change': 2},
    {'name': 'Victor', 'score': 982, 'avatar': 'https://randomuser.me/api/portraits/men/10.jpg', 'username': '@victor', 'change': -1},
  ];

  static final List<Map<String, dynamic>> leaderboardUsersNational = [
    {'name': 'Walter', 'score': 854, 'avatar': 'https://randomuser.me/api/portraits/men/11.jpg', 'username': '@walter', 'change': 1},
    {'name': 'Xena', 'score': 1002, 'avatar': 'https://randomuser.me/api/portraits/women/11.jpg', 'username': '@xena', 'change': -1},
    {'name': 'Yves', 'score': 993, 'avatar': 'https://randomuser.me/api/portraits/men/12.jpg', 'username': '@yves', 'change': 2},
    {'name': 'Zara', 'score': 684, 'avatar': 'https://randomuser.me/api/portraits/women/12.jpg', 'username': '@zara', 'change': -2},
    {'name': 'Arthur', 'score': 941, 'avatar': 'https://randomuser.me/api/portraits/men/13.jpg', 'username': '@arthur', 'change': 0},
    {'name': 'Bella', 'score': 374, 'avatar': 'https://randomuser.me/api/portraits/women/13.jpg', 'username': '@bella', 'change': 1},
    {'name': 'Celine', 'score': 842, 'avatar': 'https://randomuser.me/api/portraits/women/14.jpg', 'username': '@celine', 'change': -1},
    {'name': 'Daniel', 'score': 1495, 'avatar': 'https://randomuser.me/api/portraits/men/14.jpg', 'username': '@daniel', 'change': 0},
    {'name': 'Elaine', 'score': 1431, 'avatar': 'https://randomuser.me/api/portraits/women/15.jpg', 'username': '@elaine', 'change': 2},
    {'name': 'Freddie', 'score': 1200, 'avatar': 'https://randomuser.me/api/portraits/men/15.jpg', 'username': '@freddie', 'change': -2},
    {'name': 'Gabriel', 'score': 1327, 'avatar': 'https://randomuser.me/api/portraits/men/16.jpg', 'username': '@gabriel', 'change': 1},
    {'name': 'Hannah', 'score': 942, 'avatar': 'https://randomuser.me/api/portraits/women/16.jpg', 'username': '@hannah', 'change': -1},
    {'name': 'Isaac', 'score': 764, 'avatar': 'https://randomuser.me/api/portraits/men/17.jpg', 'username': '@isaac', 'change': 0},
    {'name': 'Julia', 'score': 948, 'avatar': 'https://randomuser.me/api/portraits/women/17.jpg', 'username': '@julia', 'change': 1},
    {'name': 'Kevin', 'score': 743, 'avatar': 'https://randomuser.me/api/portraits/men/18.jpg', 'username': '@kevin', 'change': -1},
    {'name': 'Luna', 'score': 879, 'avatar': 'https://randomuser.me/api/portraits/women/18.jpg', 'username': '@luna', 'change': 2},
    {'name': 'Mason', 'score': 684, 'avatar': 'https://randomuser.me/api/portraits/men/19.jpg', 'username': '@mason', 'change': -2},
    {'name': 'Nina', 'score': 925, 'avatar': 'https://randomuser.me/api/portraits/women/19.jpg', 'username': '@nina', 'change': 0},
    {'name': 'Oscar', 'score': 957, 'avatar': 'https://randomuser.me/api/portraits/men/20.jpg', 'username': '@oscar', 'change': 1},
    {'name': 'Paula', 'score': 860, 'avatar': 'https://randomuser.me/api/portraits/women/20.jpg', 'username': '@paula', 'change': -1},
  ];

  static final List<Map<String, dynamic>> leaderboardUsersGlobal = [
    {'name': 'Quincy', 'score': 1874, 'avatar': 'https://randomuser.me/api/portraits/men/21.jpg', 'username': '@quincy', 'change': 1},
    {'name': 'Rachel', 'score': 1732, 'avatar': 'https://randomuser.me/api/portraits/women/21.jpg', 'username': '@rachel', 'change': -1},
    {'name': 'Sam', 'score': 1649, 'avatar': 'https://randomuser.me/api/portraits/men/22.jpg', 'username': '@sam', 'change': 0},
    {'name': 'Tina', 'score': 1473, 'avatar': 'https://randomuser.me/api/portraits/women/22.jpg', 'username': '@tina', 'change': 2},
    {'name': 'Umar', 'score': 2034, 'avatar': 'https://randomuser.me/api/portraits/men/23.jpg', 'username': '@umar', 'change': -2},
    {'name': 'Vera', 'score': 2174, 'avatar': 'https://randomuser.me/api/portraits/women/23.jpg', 'username': '@vera', 'change': 1},
    {'name': 'Wendy', 'score': 1944, 'avatar': 'https://randomuser.me/api/portraits/women/24.jpg', 'username': '@wendy', 'change': -1},
    {'name': 'Xavier', 'score': 1585, 'avatar': 'https://randomuser.me/api/portraits/men/24.jpg', 'username': '@xavier', 'change': 2},
    {'name': 'Yasmine', 'score': 1555, 'avatar': 'https://randomuser.me/api/portraits/women/25.jpg', 'username': '@yasmine', 'change': -2},
    {'name': 'Zach', 'score': 1483, 'avatar': 'https://randomuser.me/api/portraits/men/25.jpg', 'username': '@zach', 'change': 0},
    {'name': 'Abby', 'score': 1756, 'avatar': 'https://randomuser.me/api/portraits/women/26.jpg', 'username': '@abby', 'change': 1},
    {'name': 'Ben', 'score': 1774, 'avatar': 'https://randomuser.me/api/portraits/men/26.jpg', 'username': '@ben', 'change': -1},
    {'name': 'Clara', 'score': 1890, 'avatar': 'https://randomuser.me/api/portraits/women/27.jpg', 'username': '@clara', 'change': 0},
    {'name': 'David', 'score': 1659, 'avatar': 'https://randomuser.me/api/portraits/men/27.jpg', 'username': '@david', 'change': 2},
    {'name': 'Erin', 'score': 1870, 'avatar': 'https://randomuser.me/api/portraits/women/28.jpg', 'username': '@erin', 'change': -2},
    {'name': 'Fiona', 'score': 1832, 'avatar': 'https://randomuser.me/api/portraits/women/29.jpg', 'username': '@fiona', 'change': 1},
    {'name': 'George', 'score': 1321, 'avatar': 'https://randomuser.me/api/portraits/men/28.jpg', 'username': '@george', 'change': -1},
    {'name': 'Helen', 'score': 1895, 'avatar': 'https://randomuser.me/api/portraits/women/30.jpg', 'username': '@helen', 'change': 2},
    {'name': 'Ian', 'score': 1701, 'avatar': 'https://randomuser.me/api/portraits/men/29.jpg', 'username': '@ian', 'change': -2},
    {'name': 'Jane', 'score': 1836, 'avatar': 'https://randomuser.me/api/portraits/women/31.jpg', 'username': '@jane', 'change': 0},
  ];

static final Map<String, dynamic> userProfile = {
    'name': 'Nathan STAMPFLI',
    'avatar': 'https://static.wikia.nocookie.net/dofus/images/f/fd/Dark_Vlad_%28server%29.png/revision/latest?cb=20170710134200',
    'username': '@NathanStmpfl',
    'email': 'nathanstmpfl@gmail.com',
    'location': 'Paris, FR',
    'joined': 'March 2024',
     'stats': {
      'quizzesTaken': 25,
      'correctAnswers': 200,
      'totalPoints': 5000,
      'highestScore': 200,
      'averageScore': 150,
      'themes': {
        'Science': {
          'quizzesTaken': 10,
          'correctAnswers': 80,
          'averageTime': '30s',
          'accuracy': '80%'
        },
        'History': {
          'quizzesTaken': 5,
          'correctAnswers': 40,
          'averageTime': '45s',
          'accuracy': '75%'
        },
        'Geography': {
          'quizzesTaken': 7,
          'correctAnswers': 50,
          'averageTime': '40s',
          'accuracy': '71%'
        },
        'Literature': {
          'quizzesTaken': 3,
          'correctAnswers': 30,
          'averageTime': '35s',
          'accuracy': '85%'
        }
      },
      'overallAccuracy': '78%',
      'averageTimePerQuiz': '35s'
    }
  };

static final List<QuizTheme> quizThemes = [
    QuizTheme(name: "Animals", color: "0xFF76B041", value: "animals"),
    QuizTheme(name: "History", color: "0xFF795548", value: "history"),
    QuizTheme(name: "Arts", color: "0xFF3B7DD8", value: "arts"),
    QuizTheme(name: "Video Games", color: "0xFFCC0000", value: "video_games"),
    QuizTheme(name: "General Culture", color: "0xFF4CAF50", value: "general_culture"),
    QuizTheme(name: "Comics", color: "0xFFE91E63", value: "comics", tag: 'coming soon'),
    QuizTheme(name: "Celebrities", color: "0xFF9C27B0", value: "celebrities", tag: 'coming soon'),
    QuizTheme(name: "Cinema", color: "0xFF673AB7", value: "cinema", tag: 'coming soon'),
    QuizTheme(name: "Gastronomy", color: "0xFFFFC107", value: "gastronomy", tag: 'coming soon'),
    QuizTheme(name: "Geography", color: "0xFF2196F3", value: "geography", tag: 'coming soon'),
    QuizTheme(name: "Archaeology", color: "0xFFD4A017", value: "archaeology", tag: 'coming soon'),
  ];
}
