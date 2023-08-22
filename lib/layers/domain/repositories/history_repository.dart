import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';

abstract class HistoryRepository {
  /// Obtém do banco de dados local, a lista de todos os registros de respostas
  /// dadas pelo usuário nos questionários.
  Future<List<AlternativeEntity>> getHistory();

  /// Salva as informações sobre o questionário recém-respondido.
  Future<bool> saveCurrentQuizAnswers(List<AlternativeEntity> answers);

  /// Apaga o registro de respostas do usuário de um questionário específico.
  Future<bool> deleteHistoryRegister(int quizId);
}