import 'package:adv_basics/models/answered_question.dart';
import 'package:adv_basics/results_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz, this.answeredQuestions, {super.key});

  final void Function() restartQuiz;
  final List<AnsweredQuestion> answeredQuestions;

  int get correctAnswers => answeredQuestions
      .where((question) => question.answer == question.correctAnswer)
      .length;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz finished! $correctAnswers of ${answeredQuestions.length} correct!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
                child: ResultsList(answeredQuestions: answeredQuestions)),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(Icons.replay_rounded),
            label: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
