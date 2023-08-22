import 'package:checkmob_quiz/layers/data/datasources/remote/quiz_datasource/quiz_datasource.dart';
import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/quiz_repository.dart';

class QuizRepositoryImp implements QuizRepository {
  final QuizDataSource _quizDataSource;
  final List<int> _allAvailableQuizzesIds = [];
  final List<QuizEntity> _allQuizzes = [];

  QuizRepositoryImp(this._quizDataSource);

  @override
  Future<List<QuizEntity>> getAllQuizzes() async {
    // Só se obtém a lista de IDs dos formulários disponíveis uma vez.
    // Depois disso, eles ficam armazenados localmente para melhor desempenho;
    if (_allAvailableQuizzesIds.isEmpty) {
      _allAvailableQuizzesIds.addAll(
        await _quizDataSource.getAllAvailableQuizzesIds(),
      );
    }

    // Os IDs serão usados para carregar todos os questionários disponíveis;
    for (int quizId in _allAvailableQuizzesIds) {
      // Verifica se o Quiz do ID já existe na lista de Quizzes carregados;
      bool isExistingQuiz = false;
      for (QuizEntity quiz in _allQuizzes) {
        if (quiz.quizId == quizId) {
          isExistingQuiz = true;
          break;
        }
      }

      // Se o Quiz já foi carregado, a requisição desse ID não ocorrerá;
      // Isso para haver menos requisições ao servidor, usando os dados locais;
      // Dessa forma nenhum Quiz será carregado duas vezes;
      if (isExistingQuiz) continue;

      final quiz = await _quizDataSource.getQuiz(quizId);
      _allQuizzes.add(quiz);
    }

    return _allQuizzes;
  }
}
