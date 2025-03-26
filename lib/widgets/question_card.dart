import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question.dart';
import '../providers/answer_provider.dart';
import '../widgets/option_button.dart';

class QuestionCard extends ConsumerWidget {
  final Question question;
  final int questionIndex;
  final VoidCallback onAnswerSelected;

  QuestionCard({
    required this.question,
    required this.questionIndex,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${questionIndex + 1}:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              question.question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 15),
            ...List.generate(
              question.options.length,
                  (index) => OptionButton(
                optionText: question.options[index],
                onTap: () {
                  ref.read(answerProvider.notifier).submitAnswer(questionIndex, index);
                  onAnswerSelected(); // Move to the next question on answer selection
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


