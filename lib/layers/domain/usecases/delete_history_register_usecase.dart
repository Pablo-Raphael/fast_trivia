import 'package:checkmob_quiz/layers/domain/repositories/quizzes_repository.dart';

/// Apaga do banco de dados um registro de resposta em específico.
class DeleteHistoryRegisterUsecase {
  final QuizzesRepository _quizzesRepository;

  DeleteHistoryRegisterUsecase(this._quizzesRepository);

  Future<bool> call(int quizId) async {
    return await _quizzesRepository.deleteHistoryRegister(quizId);
  }
}