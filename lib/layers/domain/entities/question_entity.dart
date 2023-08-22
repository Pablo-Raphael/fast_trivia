import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';

class QuestionEntity {
  int questionId;
  int quizId;
  String title;
  String question;
  int correctAnswer;
  List<AlternativeEntity> alternatives;

  QuestionEntity({
    required this.questionId,
    required this.quizId,
    required this.title,
    required this.question,
    required this.correctAnswer,
    required this.alternatives,
  });
}
