import 'package:basic_quiz_app/data/question.dart';
import 'package:basic_quiz_app/homepage.dart';
import 'package:basic_quiz_app/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:basic_quiz_app/results_screen.dart';
// import 'package:basic_quiz_app/results_screen.dart';
// import 'package:basic_quiz_app/gradientcontainer.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = HomePage(startQuiz: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswer: selectedAnswers,
          restartQuiz: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(121, 3, 241, 3),
              Color.fromARGB(96, 2, 102, 52)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Center(
            child: activeScreen,
          ),
        ),
        // body: GradientContainer(
        //  Color.fromARGB(121, 3, 241, 3), Color.fromARGB(96, 2, 102, 52)),
      ),
    );
  }
}
