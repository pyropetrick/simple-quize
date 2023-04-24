import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quize_project/ui/questions_summary.dart';
import '/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getAnswersData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i + 1,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getAnswersData();
    final amountQuestions = questions.length;
    final amountCorrectAnswers = summaryData
        .where((data) => data["correct_answer"] == data["user_answer"])
        .length;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $amountCorrectAnswers out of $amountQuestions questions correctly",
              style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 195, 195, 235),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Restart quiz"),
            )
          ],
        ),
      ),
    );
  }
}
