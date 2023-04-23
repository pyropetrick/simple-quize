import 'package:flutter/material.dart';

import 'question_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  static const colors = [
    Color.fromARGB(255, 46, 4, 118),
    Color.fromARGB(255, 21, 5, 142)
  ];

  String activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: colors),
            ),
            child: activeScreen == "start-screen"
                ? StartScreen(switchScreen)
                : const QuestionScreen(),
          ),
        ),
      ),
    );
  }
}
