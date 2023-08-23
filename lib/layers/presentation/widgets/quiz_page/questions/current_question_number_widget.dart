import 'package:checkmob_quiz/layers/domain/entities/question_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

/// Widget que indica o número da pergunta atual.
class CurrentQuestionNumberWidget extends StatelessWidget {
  CurrentQuestionNumberWidget({
    required this.question,
    Key? key,
  }) : super(key: key);

  final QuestionEntity question;
  final QuizController _quizController = GetIt.I.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => _quizController.changeCurrentQuestion(questionId: question.questionId),
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.03,
              backgroundColor: _quizController.currentQuestion?.questionId == question.questionId
                  ? Colors.white
                  : Colors.orangeAccent,
              child: Text(
                question.questionId.toString(),
                style: TextStyle(
                  color: _quizController.currentQuestion?.questionId == question.questionId
                      ? Colors.black
                      : Colors.white,
                  fontWeight: _quizController.currentQuestion?.questionId == question.questionId
                      ? FontWeight.w700
                      : FontWeight.normal,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
