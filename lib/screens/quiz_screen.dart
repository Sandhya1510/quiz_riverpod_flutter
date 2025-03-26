// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/question_provider.dart';
// import '../widgets/question_card.dart';
// import 'result_screen.dart';
//
// class QuizScreen extends ConsumerStatefulWidget {
//   @override
//   ConsumerState<QuizScreen> createState() => _QuizScreenState();
// }
//
// class _QuizScreenState extends ConsumerState<QuizScreen> {
//   int currentQuestionIndex = 0;
//
//   void _nextQuestion(List questions) {
//     if (currentQuestionIndex < questions.length - 1) {
//       setState(() {
//         currentQuestionIndex++;
//       });
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => ResultScreen()),
//       );
//     }
//   }
//
//   void _prevQuestion() {
//     if (currentQuestionIndex > 0) {
//       setState(() {
//         currentQuestionIndex--;
//       });
//     }
//   }
//
//   void _onAnswerSelected(List questions) {
//     _nextQuestion(questions);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final questions = ref.watch(questionProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Quiz Screen")),
//       body: questions.when(
//         data: (data) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: QuestionCard(
//                   question: data[currentQuestionIndex],
//                   questionIndex: currentQuestionIndex,
//                   onAnswerSelected: () => _onAnswerSelected(data),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex > 0 ? _prevQuestion : null,
//                     child: Text("Previous"),
//                   ),
//                   ElevatedButton(
//                     onPressed: currentQuestionIndex < data.length - 1
//                         ? () => _nextQuestion(data)
//                         : null,
//                     child: Text("Next"),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (err, stack) => Center(child: Text("Error loading questions")),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/question_provider.dart';
import '../widgets/question_card.dart';
import 'result_screen.dart';

class QuizScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  int currentQuestionIndex = 0;

  void _nextQuestion(List questions) {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ResultScreen()),
      );
    }
  }

  void _prevQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _onAnswerSelected(List questions) {
    _nextQuestion(questions);
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(questionProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz Screen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: questions.when(
        data: (data) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: QuestionCard(
                    question: data[currentQuestionIndex],
                    questionIndex: currentQuestionIndex,
                    onAnswerSelected: () => _onAnswerSelected(data),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: currentQuestionIndex > 0 ? _prevQuestion : null,
                      icon: Icon(Icons.arrow_back),
                      label: Text("Previous"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: currentQuestionIndex < data.length - 1
                          ? () => _nextQuestion(data)
                          : null,
                      icon: Icon(Icons.arrow_forward),
                      label: Text("Next"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        textStyle: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(color: Colors.deepPurple),
        ),
        error: (err, stack) => Center(
          child: Text(
            "Error loading questions",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
