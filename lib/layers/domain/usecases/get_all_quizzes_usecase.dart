import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/quizzes_repository.dart';

/// retorna a lista de todos os questionários disponíveis no servidor.
class GetAllQuizzesUsecase {
  final QuizzesRepository _quizzesRepository;

  GetAllQuizzesUsecase(this._quizzesRepository);

  Future<List<QuizEntity>> call() async {
    return await _quizzesRepository.getAllQuizzes();
  }
}