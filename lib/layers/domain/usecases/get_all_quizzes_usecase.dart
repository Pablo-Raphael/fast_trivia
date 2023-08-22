import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/quiz_repository.dart';

/// retorna a lista de todos os questionários disponíveis no servidor.
class GetAllQuizzesUsecase {
  final QuizRepository _quizRepository;

  GetAllQuizzesUsecase(this._quizRepository);

  Future<List<QuizEntity>> call() async {
    return _quizRepository.getAllQuizzes();
  }
}