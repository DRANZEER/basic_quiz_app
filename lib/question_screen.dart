import 'package:basic_quiz_app/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:basic_quiz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:basic_quiz_app/models/quiz_question.dart';
// import 'package:basic_quiz_app/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuizquestionState();
  }
}

class _QuizquestionState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(Object context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswer().map((answer) {
            return AnswerButton(
              answerText: answer,
              onTap: () {
                answerQuestion(answer);
              },
            );
          })
        ],
      ),
    );
  }
}
