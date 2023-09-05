import 'package:flutter/material.dart';
import 'package:adv_basics/result_element.dart';
import 'models/answered_question.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({super.key, required this.answeredQuestions});

  final List<AnsweredQuestion> answeredQuestions;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...answeredQuestions.map((question) {
        return ResultElement(question);
      }).toList()
    ]);
  }
}
