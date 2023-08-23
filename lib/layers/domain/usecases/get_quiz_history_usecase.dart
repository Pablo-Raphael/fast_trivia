import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/quizzes_repository.dart';

/// Obtém todas as respostas do usuário para um questionário específico.
class GetQuizHistoryUsecase {
  final QuizzesRepository _quizzesRepository;

  GetQuizHistoryUsecase(this._quizzesRepository);

  List<AlternativeEntity> call(int quizId) {
    return _quizzesRepository.getQuizHistory(quizId);
  }
}