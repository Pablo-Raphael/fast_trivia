import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/quiz_page/questions/current_question_number_widget.dart';
import 'package:flutter/material.dart';

/// Lista horizontal que mostra o número de todas as questões do questionário.
class QuestionsIndicatorWidget extends StatelessWidget {
  const QuestionsIndicatorWidget({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final QuizEntity quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.015,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: quiz.questions.map(
            (question) {
              return CurrentQuestionNumberWidget(
                question: question,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
