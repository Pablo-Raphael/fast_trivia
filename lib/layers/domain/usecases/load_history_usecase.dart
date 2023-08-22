import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/history_repository.dart';

/// Carrega o histórico de respostas do usuário.
class LoadHistoryUsecase {
  final HistoryRepository _historyRepository;

  LoadHistoryUsecase(this._historyRepository);

  Future<List<AlternativeEntity>> call() async {
    return await _historyRepository.getHistory();
  }
}