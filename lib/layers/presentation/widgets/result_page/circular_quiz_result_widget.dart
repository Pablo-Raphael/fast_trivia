import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Indicador circular da porcentagem de acerto do usuário num questionário.
class CircularQuizResult extends StatelessWidget {
  const CircularQuizResult({
    Key? key,
    required this.numberOfCorrectAnswers,
    required this.totalNumberOfQuestions,
  }) : super(key: key);

  final int numberOfCorrectAnswers;
  final int totalNumberOfQuestions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.025,
      ),
      child: CircularPercentIndicator(
        radius: MediaQuery.of(context).size.height * 0.06,
        lineWidth: 5.0,
        percent: numberOfCorrectAnswers / totalNumberOfQuestions,
        center: Text(
          "${(numberOfCorrectAnswers / totalNumberOfQuestions * 100).round()}%",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        progressColor: Colors.green,
      ),
    );
  }
}
