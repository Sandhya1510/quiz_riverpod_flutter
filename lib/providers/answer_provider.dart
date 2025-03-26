import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnswerNotifier extends StateNotifier<List<int>> {
  AnswerNotifier() : super([]);

  void submitAnswer(int questionIndex, int answerIndex) {
    if (questionIndex < state.length) {
      state[questionIndex] = answerIndex;
    } else {
      state = [...state, answerIndex];
    }
  }

  void resetAnswers() {
    state = [];
  }
}

final answerProvider = StateNotifierProvider<AnswerNotifier, List<int>>((ref) {
  return AnswerNotifier();
});



