import 'package:checkmob_quiz/layers/domain/entities/question_entity.dart';

class QuizEntity {
  int quizId;
  String title;
  List<QuestionEntity> questions;

  QuizEntity({
    required this.quizId,
    required this.title,
    required this.questions,
  });
}
