import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CurrentQuestionTitleWidget extends StatelessWidget {
  CurrentQuestionTitleWidget({Key? key}) : super(key: key);

  final QuizController _quizController = GetIt.I.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Center(
        child: Observer(
          builder: (context) {
            return Text(
              _quizController.currentQuestion?.question ?? "Carregando Questão",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            );
          }
        ),
      ),
    );
  }
}
