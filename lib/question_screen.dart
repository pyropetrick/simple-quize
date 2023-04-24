import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/data/questions.dart';
import '/ui/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswer});

  final void Function(String answer) onAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  answerQuestion(String selectedAnswer) {
    widget.onAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              activeQuestion.question,
              style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 153, 165, 231),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...activeQuestion.getShuffledAnswers().map(
                  (answer) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnswerButton(
                      text: answer,
                      handleClick: () {
                        answerQuestion(answer);
                      },
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
