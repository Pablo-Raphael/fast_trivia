import 'package:checkmob_quiz/layers/domain/repositories/quizzes_repository.dart';

/// Carrega o histórico de respostas do usuário.
class LoadHistoryUsecase {
  final QuizzesRepository _quizzesRepository;

  LoadHistoryUsecase(this._quizzesRepository);

  Future<bool> call() async {
    return await _quizzesRepository.loadHistory();
  }
}