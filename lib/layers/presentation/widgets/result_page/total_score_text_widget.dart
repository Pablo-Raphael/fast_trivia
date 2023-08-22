import 'package:flutter/material.dart';

class TotalScoresTextWidget extends StatelessWidget {
  const TotalScoresTextWidget({
    Key? key,
    required this.numberOfCorrectAnswers,
    required this.totalNumberOfQuestions,
  }) : super(key: key);

  final int numberOfCorrectAnswers;
  final int totalNumberOfQuestions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Parabéns, você acertou  ",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        Text(
          "$numberOfCorrectAnswers/$totalNumberOfQuestions",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Text(
          "  Questões",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
