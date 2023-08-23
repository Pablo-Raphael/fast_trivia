import 'package:checkmob_quiz/layers/data/datasources/local/user_history_datasource/quiz_local_datasource.dart';
import 'package:checkmob_quiz/layers/data/datasources/remote/quiz_remote_datasource/quiz_remote_datasource.dart';
import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/quizzes_repository.dart';

class QuizzesRepositoryImp implements QuizzesRepository {
  late final QuizLocalDataSource _quizLocalDataSource;
  late final QuizRemoteDataSource _quizRemoteDataSource;

  QuizzesRepositoryImp({
    required QuizLocalDataSource quizLocalDataSource,
    required QuizRemoteDataSource quizRemoteDataSource,
  }) {
    _quizLocalDataSource = quizLocalDataSource;
    _quizRemoteDataSource = quizRemoteDataSource;
  }

  final List<AlternativeEntity> history = [];

  @override
  Future<List<QuizEntity>> getAllQuizzes() async {
    final List<QuizEntity> allQuizzes = [];

    final allAvailableQuizzesIds = await _quizRemoteDataSource.getAllAvailableQuizzesIds();

    for (int quizId in allAvailableQuizzesIds) {
      final quiz = await _quizRemoteDataSource.getQuiz(quizId);
      quiz.isAlreadyAnswered = _isQuizAlreadyAnswered(quizId);
      allQuizzes.add(quiz);
    }

    return allQuizzes;
  }

  @override
  Future<bool> loadHistory() async {
    try {
      final loadedHistory = await _quizLocalDataSource.getHistory();
      history.clear();
      history.addAll(loadedHistory);

      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> saveCurrentQuizAnswers(List<AlternativeEntity> answers) async {
    Map<String, dynamic> answersMap = {
      "quiz_id": answers.first.quizId,
      "questions": answers.map(
        (alternative) {
          return {
            "question_id": alternative.questionId,
            "alternative_id": alternative.alternativeId,
            "alternative_title": alternative.title,
          };
        },
      ).toList(),
    };

    return await _quizLocalDataSource.saveRegisterInHistory(answersMap);
  }

  @override
  Future<bool> deleteHistoryRegister(int quizId) async {
    return _quizLocalDataSource.deleteHistoryRegister(quizId);
  }

  @override
  List<AlternativeEntity> getQuizHistory(int quizId) {
    return history.where((alternative) {
      return alternative.quizId == quizId;
    }).toList();
  }

  /// Informa se um quiz já foi respondido ou não.
  bool _isQuizAlreadyAnswered(int quizId) {
    for (AlternativeEntity alternative in history) {
      if (alternative.quizId == quizId) {
        return true;
      }
    }

    return false;
  }
}
