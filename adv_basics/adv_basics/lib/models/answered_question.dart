class AnsweredQuestion {
  int index;
  String questionText;
  String answer;
  String correctAnswer;

  bool get isCorrect => answer == correctAnswer;

  AnsweredQuestion({
    required this.index,
    required this.questionText,
    required this.answer,
    required this.correctAnswer,
  });
}
