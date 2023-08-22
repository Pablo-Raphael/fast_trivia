import 'package:checkmob_quiz/layers/data/models/alternative_model.dart';
import 'package:checkmob_quiz/layers/domain/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  final int id;
  final int quizId;
  final String titulo;
  final String questoes;
  final int gabarito;
  final List<AlternativeModel> alternativas;

  QuestionModel({
    required this.id,
    required this.quizId,
    required this.titulo,
    required this.questoes,
    required this.gabarito,
    required this.alternativas,
  }) : super(
          questionId: id,
          quizId: quizId,
          title: titulo,
          question: questoes,
          correctAnswer: gabarito,
          alternatives: alternativas,
        );

  factory QuestionModel.fromJson({
    required Map<String, dynamic> questionJson,
    required int quizId,
  }) {
    final alternativesList = questionJson['alternativas'] as List<dynamic>;
    final alternatives = alternativesList
        .map(
          (alternativeJson) => AlternativeModel.fromJson(
            alternativeJson: alternativeJson,
            questionId: questionJson['id'],
            quizId: quizId,
          ),
        )
        .toList();

    return QuestionModel(
      id: questionJson['id'],
      quizId: quizId,
      titulo: questionJson['titulo'],
      questoes: questionJson['pergunta'],
      gabarito: questionJson['gabarito'],
      alternativas: alternatives,
    );
  }
}
