import 'package:checkmob_quiz/layers/data/models/question_model.dart';
import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';

class QuizModel extends QuizEntity {
  final int id;
  final String titulo;
  final List<QuestionModel> questoes;

  QuizModel({
    required this.id,
    required this.titulo,
    required this.questoes,
  }) : super(
          quizId: id,
          title: titulo,
          questions: questoes,
        );

  factory QuizModel.fromJson({required Map<String, dynamic> quizJson}) {
    final questionsList = quizJson['questoes'] as List<dynamic>;
    final questions = questionsList
        .map(
          (questionJson) => QuestionModel.fromJson(
            questionJson: questionJson,
            quizId: quizJson["id"],
          ),
        )
        .toList();

    return QuizModel(
      id: quizJson['id'],
      titulo: quizJson['titulo'],
      questoes: questions,
    );
  }
}
