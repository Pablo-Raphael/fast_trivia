import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';

class AlternativeModel extends AlternativeEntity {
  final int id;
  final String titulo;
  final int questionId;
  final int quizId;

  AlternativeModel({
    required this.id,
    required this.questionId,
    required this.quizId,
    required this.titulo,
  }) : super(
          alternativeId: id,
          questionId: questionId,
          quizId: quizId,
          title: titulo,
        );

  factory AlternativeModel.fromJson({
    required Map<String, dynamic> alternativeJson,
    required int questionId,
    required int quizId,
  }) {
    return AlternativeModel(
      id: alternativeJson['id'],
      questionId: questionId,
      quizId: quizId,
      titulo: alternativeJson['titulo'],
    );
  }
}
