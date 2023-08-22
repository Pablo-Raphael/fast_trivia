import 'package:checkmob_quiz/layers/data/datasources/local/user_history_datasource/history_datasource.dart';
import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/repositories/history_repository.dart';

class HistoryRepositoryImp implements HistoryRepository {
  final HistoryDataSource _historyDataSource;

  HistoryRepositoryImp(this._historyDataSource);

  @override
  Future<List<AlternativeEntity>> getHistory() async {
    return await _historyDataSource.getHistory();
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

    return await _historyDataSource.saveRegisterInHistory(answersMap);
  }

  @override
  Future<bool> deleteHistoryRegister(int quizId) async {
    return _historyDataSource.deleteHistoryRegister(quizId);
  }
}
