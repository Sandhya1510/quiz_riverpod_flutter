import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question.dart';

final questionProvider = FutureProvider<List<Question>>((ref) async {
  await Future.delayed(Duration(seconds: 1)); // Simulated delay
  return [
    Question(
      question: "1. What is the default file extension for an Android layout file?",
      options: ["html", "xml", "json", "css"],
      answer: 1,
    ),
    Question(
      question: "2. Which of the following is used to define a clickable button in Android?",
      options: ["<input>", "<button>", "<Button>", "<clickable>"],
      answer: 2,
    ),
    Question(
      question: "3. Which method is used to display a short message to the user?",
      options: ["Log.d()", "Toast.makeText()", "AlertDialog.show()", "System.out.println()"],
      answer: 1,
    ),
    Question(
      question: "4. What does AVD stand for in Android Studio?",
      options: ["Android Virtual Design", "Android Virtual Device", "App Visual Design", "Advanced Visual Display"],
      answer: 1,
    ),
    Question(
      question: "5. Which XML attribute is used to set the text of a TextView?",
      options: ["textColor", "textSize", "text", "textStyle"],
      answer: 2,
    ),
    Question(
      question: "6. Which method is called when an Activity is first created?",
      options: ["onStart()", "onCreate()", "onResume()", "onPause()"],
      answer: 1,
    ),
    Question(
      question: "7. Which method is used to find a view by its ID in an Activity?",
      options: ["findViewById()", "findById()", "getViewById()", "findId()"],
      answer: 0,
    ),
    Question(
      question: "8. What is the parent class of all Activities in Android?",
      options: ["Application", "Context", "Activity", "View"],
      answer: 2,
    ),
    Question(
      question: "9. Which programming languages are mainly used in Android Studio?",
      options: ["Python and Ruby", "Java and Kotlin", "C++ and Swift", "PHP and HTML"],
      answer: 1,
    ),
    Question(
      question: "10. Which of these is not a valid Android component?",
      options: ["Activity", "Fragment", "Broadcast Receiver", "Controller"],
      answer: 3,
    ),
  ];
});
