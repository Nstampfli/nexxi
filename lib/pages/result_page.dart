import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'theme_selection_page.dart';

class ResultPage extends StatefulWidget {
  final int score;
  final int total;
  final double successRate;
  final double averageTime;
  final int fastAnswers;

  ResultPage({
    required this.score,
    required this.total,
    required this.successRate,
    required this.averageTime,
    required this.fastAnswers,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> with TickerProviderStateMixin {
  late ConfettiController _confettiControllerLeft;
  late ConfettiController _confettiControllerCenter;
  late ConfettiController _confettiControllerRight;
  late AnimationController _animationController;
  List<AnimationController> _cardAnimationControllers = [];
  List<Animation<Offset>> _cardAnimations = [];

  @override
  void initState() {
    super.initState();
    _confettiControllerLeft = ConfettiController(duration: const Duration(seconds: 1));
    _confettiControllerCenter = ConfettiController(duration: const Duration(seconds: 1));
    _confettiControllerRight = ConfettiController(duration: const Duration(seconds: 1));
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    if (widget.successRate > 50) {
      _confettiControllerLeft.play();
      _confettiControllerCenter.play();
      _confettiControllerRight.play();
    }

    _animationController.forward();

    for (int i = 0; i < 3; i++) {
      AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
      _cardAnimationControllers.add(controller);
      Animation<Offset> animation = Tween<Offset>(
        begin: Offset(-1.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ));
      _cardAnimations.add(animation);
      Future.delayed(Duration(milliseconds: 300 * i), () {
        if (mounted) {
          controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _confettiControllerLeft.dispose();
    _confettiControllerCenter.dispose();
    _confettiControllerRight.dispose();
    _animationController.dispose();
    for (var controller in _cardAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildConfettiWidget(ConfettiController controller, Alignment alignment, double direction) {
    return Align(
      alignment: alignment,
      child: ConfettiWidget(
        confettiController: controller,
        blastDirection: direction,
        maxBlastForce: 100,
        minBlastForce: 80,
        emissionFrequency: 0.05,
        numberOfParticles: 10,
        gravity: 0.3,
        colors: [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Animation<Offset> animation) {
    return SlideTransition(
      position: animation,
      child: Card(
        color: Color(0xFF1E2237),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: Colors.amber, size: 30),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: Color(0xFF151729),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        '${widget.score} / ${widget.total}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Your Score',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Column(
                  children: [
                    _buildStatCard('Success Rate', '${widget.successRate.toStringAsFixed(2)}%', Icons.assessment, _cardAnimations[0]),
                    SizedBox(height: 16),
                    _buildStatCard('Average Time per Question', '${widget.averageTime.toStringAsFixed(2)} seconds', Icons.timer, _cardAnimations[1]),
                    SizedBox(height: 16),
                    _buildStatCard('Fast Answers (<5s)', '${widget.fastAnswers}', Icons.flash_on, _cardAnimations[2]),
                  ],
                ),
                SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => ThemeSelectionPage()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: Text('Back to Home'),
                  ),
                ),
              ],
            ),
          ),
          if (widget.successRate > 50) ...[
            _buildConfettiWidget(_confettiControllerLeft, Alignment.bottomLeft, -pi / 4),
            _buildConfettiWidget(_confettiControllerCenter, Alignment.bottomCenter, -pi / 2),
            _buildConfettiWidget(_confettiControllerRight, Alignment.bottomRight, -3 * pi / 4),
          ],
        ],
      ),
    );
  }
}
