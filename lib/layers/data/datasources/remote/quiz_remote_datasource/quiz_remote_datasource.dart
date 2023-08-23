import 'package:checkmob_quiz/layers/data/models/quiz_model.dart';

abstract class QuizRemoteDataSource {
  /// Envia do servidor um questionário ao passar um ID em espicífico.
  Future<QuizModel> getQuiz(int quizId);

  /// Obtém uma lista de IDS de todos os questionários disponíveis no servidor.
  Future<List<int>> getAllAvailableQuizzesIds();
}
