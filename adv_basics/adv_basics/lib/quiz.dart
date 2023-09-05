import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/answered_question.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  List<AnsweredQuestion> get answeredQuestions {
    List<AnsweredQuestion> result = [];
    for (var i = 0; i < questions.length; i++) {
      result.add(AnsweredQuestion(
          index: i,
          questionText: questions[i].question,
          answer: selectedAnswers[i],
          correctAnswer: questions[i].answers[0]));
    }
    return result;
  }

  late Widget activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(selectAnswer: selectAnswer);
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      print('Quiz finished');
      selectedAnswers.forEach(print);

      setState(() {
        activeScreen = ResultScreen(restartQuiz, answeredQuestions);
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = QuestionsScreen(selectAnswer: selectAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
