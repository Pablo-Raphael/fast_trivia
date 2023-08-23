import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';

/// Card com o gabarito de uma questão.
class CorrectionCardWidget extends StatelessWidget {
  const CorrectionCardWidget({
    Key? key,
    required this.question,
    required this.userAnswer,
  }) : super(key: key);

  final AlternativeEntity userAnswer;
  final QuestionEntity question;

  @override
  Widget build(BuildContext context) {
    final correctAlternative = question.alternatives.firstWhere((alternative) {
      return alternative.alternativeId == question.correctAnswer;
    });
    final isUserAnswerCorrect = correctAlternative.alternativeId == userAnswer.alternativeId;

    return Card(
      color: Colors.grey.shade100,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.015,
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text("• Sua resposta: ${userAnswer.title}"),
            Text("• Resposta correta: ${correctAlternative.title}"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                const Text("• Resultado: "),
                Text(
                  isUserAnswerCorrect ? "Correto" : "Incorreto",
                  style: TextStyle(
                    color: isUserAnswerCorrect ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
