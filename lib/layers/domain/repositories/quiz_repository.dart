import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';

abstract class QuizRepository {
  /// Busca no servidor todos os questionários disponíveis.
  Future<List<QuizEntity>> getAllQuizzes();
}
