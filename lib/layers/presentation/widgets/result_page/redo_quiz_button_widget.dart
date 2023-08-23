import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quizzes_controller.dart';
import 'package:checkmob_quiz/layers/presentation/pages/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// Botão que permite refazer questionário.
class RedoQuizButtonWidget extends StatelessWidget {
  RedoQuizButtonWidget({Key? key, required this.quiz}) : super(key: key);

  final QuizzesController _quizzesController = GetIt.I.get<QuizzesController>();
  final QuizEntity quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.1,
        left: MediaQuery.of(context).size.width * 0.1,
        bottom: MediaQuery.of(context).size.height * 0.04,
        top: MediaQuery.of(context).size.height * 0.01,
      ),
      child: ElevatedButton(
        onPressed: () async {
          await _quizzesController.deleteHistoryRegisterUsecase(quiz.quizId);
          await _quizzesController.loadHistory();
          _quizzesController.toogleQuizAnsweredStatus(quiz);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => QuizPage(quiz: quiz),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
        ),
        child: const Text(
          "Refazer Questionário",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
