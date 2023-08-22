import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/history_controller.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:checkmob_quiz/layers/presentation/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SubmitAlternativeButtonWidget extends StatelessWidget {
  SubmitAlternativeButtonWidget({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final QuizController _quizController = GetIt.I.get<QuizController>();
  final HistoryController _historyController = GetIt.I.get<HistoryController>();
  final QuizEntity quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Observer(
        builder: (context) {
          return ElevatedButton(
            onPressed: () async {
              _historyController.submitAlternative(
                _quizController.currentAlternative!,
              );

              // Se não for a última pergunta;
              if (!_quizController.isLastQuestion) {
                // Navega para a próxima pergunta;
                final id = _quizController.currentQuestion!.questionId;
                _quizController.changeCurrentQuestion(
                  quizId: quiz.quizId,
                  questionId: id + 1,
                );
              } else {
                // Salva persistentemente as respostas do usuário;
                await _historyController.saveCurrentQuizAnswers();
                await _historyController.loadHistory();

                // Navegação para a página de resultado;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(quiz: quiz),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
            child: Text(
              _quizController.isLastQuestion
                  ? "Finalizar Questionário"
                  : "Próxima Questão",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
