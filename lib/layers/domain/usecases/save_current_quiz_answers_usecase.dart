import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/quizzes_repository.dart';

/// Ao finalizar um questionário esse UseCase pode ser chamado para armazenar
/// as respostas num banco de dados local.
class SaveCurrentQuizAnswersUsecase {
  final QuizzesRepository _quizzesRepository;

  SaveCurrentQuizAnswersUsecase(this._quizzesRepository);

  Future<bool> call(List<AlternativeEntity> answers) async {
    return await _quizzesRepository.saveCurrentQuizAnswers(answers);
  }
}
