import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.startQuiz});

  final void Function() startQuiz;

  @override
  Widget build(Object context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 50),
        Text(
          'Learn flutter the fun way!',
          style: GoogleFonts.lato(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz,
          icon: Icon(Icons.arrow_right_alt),
          label: const Text(
            'StartQuiz',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 28,
            ),
          ),
        ),
      ],
    );
  }
}
