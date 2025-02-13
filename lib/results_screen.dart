import 'package:basic_quiz_app/data/question.dart';
import 'package:basic_quiz_app/question_summary/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:basic_quiz_app/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswer, required this.restartQuiz});

  final List<String> chosenAnswer;

  final dynamic restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You answered $numCorrectQuestion out of $numTotalQuestion question correctly!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 38, 18, 221),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summaryData: getSummaryData()),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: restartQuiz,
            style: TextButton.styleFrom(
              foregroundColor: Colors.black87,
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quize!'),
          )
        ],
      ),
    );
  }
}
