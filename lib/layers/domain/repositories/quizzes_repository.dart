import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';

abstract class QuizzesRepository {
  /// Busca no servidor todos os questionários disponíveis.
  Future<List<QuizEntity>> getAllQuizzes();

  /// Carrega do banco de dados local, a lista de todos os registros de respostas
  /// dadas pelo usuário nos questionários.
  Future<bool> loadHistory();

  /// Salva as informações sobre o questionário recém-respondido.
  Future<bool> saveCurrentQuizAnswers(List<AlternativeEntity> answers);

  /// Apaga o registro de respostas do usuário de um questionário específico.
  Future<bool> deleteHistoryRegister(int quizId);

  /// Obtém todas as respostas do usuário para um questionário específico.
  List<AlternativeEntity> getQuizHistory(int quizId);
}
