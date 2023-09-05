import 'package:adv_basics/models/answered_question.dart';
import 'package:flutter/material.dart';

class ResultElement extends StatelessWidget {
  const ResultElement(this.result, {super.key});

  final AnsweredQuestion result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(children: [
        Column(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: result.isCorrect ? Colors.blue : Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  '${result.index + 1}',
                  style: const TextStyle(
                      // backgroundColor: result.isCorrect ? Colors.blue : Colors.red,
                      fontSize: 24),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                result.questionText,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Text(
                result.answer,
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.left,
              ),
              Text(
                result.correctAnswer,
                style: const TextStyle(color: Colors.lightBlue),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
