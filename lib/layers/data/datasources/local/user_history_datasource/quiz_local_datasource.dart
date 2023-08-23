import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';

abstract class QuizLocalDataSource {
  /// Obtém todos os registros de questionários respondidos pelo usuário.
  Future<List<AlternativeEntity>> getHistory();

  /// Guarda localmente as alternativas escolhidas pelo usuário;
  Future<bool> saveRegisterInHistory(Map<String, dynamic> register);

  /// Apaga as informações sobre um questionário específico.
  Future<bool> deleteHistoryRegister(int quizId);
}