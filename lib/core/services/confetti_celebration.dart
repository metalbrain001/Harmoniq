// Project: flutter_confetti
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ConfettiCelebration extends StatefulWidget {
  const ConfettiCelebration({super.key});

  @override
  State<ConfettiCelebration> createState() => _ConfettiCelebrationState();
}

class _ConfettiCelebrationState extends State<ConfettiCelebration> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 10));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ConfettiWidget(
            confettiController: _controller,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            colors: const [Colors.red, Colors.green, Colors.blue],
            emissionFrequency: 0.05,
            numberOfParticles: 100,
            gravity: 0.1,
          ),
        ],
      ),
    );
  }
}
