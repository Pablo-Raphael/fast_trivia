import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quizzes_controller.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:checkmob_quiz/layers/presentation/pages/result_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

/// Botão de navegação ou conclusão de um questionário.
class SubmitAlternativeButtonWidget extends StatelessWidget {
  SubmitAlternativeButtonWidget({
    required this.quiz,
    Key? key,
  }) : super(key: key);

  final QuizController _quizController = GetIt.I.get<QuizController>();
  final QuizzesController _quizzesController = GetIt.I.get<QuizzesController>();
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
              _quizController.submitAlternative();

              // Se não for a última pergunta navega para a próxima pergunta;
              if (!_quizController.isLastQuestion) {
                final id = _quizController.currentQuestion!.questionId;
                _quizController.changeCurrentQuestion(questionId: id + 1);
              }

              // Se for a última questão verifica se o usuário respondeu tudo;
              else {
                // Caso o usuário não tenha respondido a todas as perguntas,
                // ele será informado que é obrigatório respondê-las;
                int totalOfQuestions = _quizController.quizAnswers.length;
                if (totalOfQuestions != quiz.questions.length) {
                  AwesomeDialog(
                    context: context,
                    title: 'Questionário incompleto',
                    desc: 'Clique no número da pergunta para ser direcionado a ela e respondê-la.',
                    dialogType: DialogType.warning,
                    headerAnimationLoop: false,
                    showCloseIcon: true,
                    animType: AnimType.leftSlide,
                  ).show();
                }
                // Se todas as perguntas foram respondidas, o resultado será
                // armazenado no histórico e o gabarito será mostrado;
                else {
                  await _quizController.saveCurrentQuizAnswers();
                  await _quizzesController.loadHistory();
                  _quizzesController.toogleQuizAnsweredStatus(quiz);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ResultPage(quiz: quiz),
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
            child: Text(
              _quizController.isLastQuestion
                  ? "Finalizar Questionário"
                  : "Confirmar Resposta",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
