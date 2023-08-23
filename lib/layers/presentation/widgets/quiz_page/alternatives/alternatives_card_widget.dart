import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/quiz_page/alternatives/alternative_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

/// Card com todas as alternativas disponíveis para uma pergunta.
class AlternativesCardWidget extends StatelessWidget {
  AlternativesCardWidget({Key? key}) : super(key: key);

  final QuizController _quizController = GetIt.I.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.025,
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03,
        ),
        child: Observer(
          builder: (context) {
            final question = _quizController.currentQuestion;
            if (question == null) {
              return const SizedBox.shrink();
            } else {
              return Observer(
                builder: (context) {
                  return Column(
                    children: _quizController.currentQuestion!.alternatives.map(
                      (alternative) {
                        return AlternativeWidget(
                          alternative: alternative,
                        );
                      },
                    ).toList(),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
