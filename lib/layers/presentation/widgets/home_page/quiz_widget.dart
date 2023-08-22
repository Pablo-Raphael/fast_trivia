import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/history_controller.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:checkmob_quiz/layers/presentation/pages/quiz_page.dart';
import 'package:checkmob_quiz/layers/presentation/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class QuizWidget extends StatelessWidget {
  QuizWidget({Key? key, required this.quiz}) : super(key: key);

  final QuizEntity quiz;
  final HistoryController _historyController = GetIt.I.get<HistoryController>();
  final QuizController _quizController = GetIt.I.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    final isAlreadyAnswered = _historyController.isQuizAlreadyAnswered(
      quiz.quizId,
    );

    return GestureDetector(
      onTap: () {
        if (isAlreadyAnswered) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ResultPage(quiz: quiz),
            ),
          );
        } else {
          _quizController.clear();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => QuizPage(quiz: quiz),
            ),
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            title: Text(
              quiz.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(isAlreadyAnswered ? "Concluído" : "Incompleto"),
            trailing: isAlreadyAnswered
                ? const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: Colors.black,
                      size: 15,
                    ),
                  )
                : const Icon(
                    Icons.chevron_right,
                  ),
          ),
        ),
      ),
    );
  }
}
