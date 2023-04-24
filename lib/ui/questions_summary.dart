import 'package:flutter/material.dart';
import 'package:quize_project/ui/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrectAnswer =
                data["correct_answer"] == data["user_answer"];
            return SummaryItem(
              isCorrectAnswer: isCorrectAnswer,
              data: data,
            );
          }).toList(),
        ),
      ),
    );
  }
}
