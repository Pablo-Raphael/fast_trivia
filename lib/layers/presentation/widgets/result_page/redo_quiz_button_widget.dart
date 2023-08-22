import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/history_controller.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:checkmob_quiz/layers/presentation/pages/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RedoQuizButtonWidget extends StatelessWidget {
  RedoQuizButtonWidget({Key? key, required this.quiz}) : super(key: key);

  final QuizController _quizController = GetIt.I.get<QuizController>();
  final HistoryController _historyController = GetIt.I.get<HistoryController>();
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
          _historyController.clear();
          _quizController.clear();

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => QuizPage(quiz: quiz),
            ),
          );

          await _historyController.deleteHistoryRegisterUsecase(quiz.quizId);
          await _historyController.loadHistory();
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
