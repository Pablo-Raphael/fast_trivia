import 'package:checkmob_quiz/layers/domain/repositories/history_repository.dart';

/// Apaga do banco de dados um registro de resposta em específico.
class DeleteHistoryRegisterUsecase {
  final HistoryRepository _historyRepository;

  DeleteHistoryRegisterUsecase(this._historyRepository);

  Future<bool> call(int quizId) async {
    return await _historyRepository.deleteHistoryRegister(quizId);
  }
}