import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(
      {super.key, required this.isCorrectAnswer, required this.data});

  final Map<String, Object> data;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final backgroundBox = isCorrectAnswer
        ? const Color.fromARGB(255, 118, 183, 120)
        : const Color.fromARGB(255, 193, 90, 83);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundBox,
            ),
            child: Text(
              (data['question_index']).toString(),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['user_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 162, 117, 239),
                      ),
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 118, 212, 121),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
