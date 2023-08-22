import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/history_repository.dart';

/// Ao finalizar um questionário esse UseCase pode ser chamado para armazenar
/// as respostas num banco de dados local.
class SaveCurrentQuizAnswersUsecase {
  final HistoryRepository _historyRepository;

  SaveCurrentQuizAnswersUsecase(this._historyRepository);

  Future<bool> call(List<AlternativeEntity> answers) async {
    return await _historyRepository.saveCurrentQuizAnswers(answers);
  }
}
