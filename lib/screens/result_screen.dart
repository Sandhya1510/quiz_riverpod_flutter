import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/answer_provider.dart';
import '../providers/question_provider.dart';
import 'home_screen.dart';

class ResultScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answers = ref.watch(answerProvider);
    final questions = ref.watch(questionProvider);

    int correctAnswers = 0;
    if (questions is AsyncData) {
      correctAnswers = answers.asMap().entries.where((entry) {
        return questions.value?[entry.key].answer == entry.value;
      }).length;
    }

    String getResultMessage() {
      if (correctAnswers == 10) return 'Excellent!';
      if (correctAnswers == 9) return 'Very Good!';
      if (correctAnswers == 8) return 'Good!';
      if (correctAnswers >= 5) return 'Average';
      return 'Need to Improve';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Score: $correctAnswers / ${questions.value?.length ?? 0}",
              style: TextStyle(
                fontSize: 22,
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              getResultMessage(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              },
              icon: Icon(Icons.home),
              label: Text("Back to Home"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
