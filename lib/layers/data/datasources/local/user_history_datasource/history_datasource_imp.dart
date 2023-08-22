import 'dart:convert';

import 'package:checkmob_quiz/layers/data/datasources/local/user_history_datasource/history_datasource.dart';
import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryDataSourceImp implements HistoryDataSource {
  @override
  Future<List<AlternativeEntity>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();

    final encodedHistory = prefs.getStringList("history") ?? [];
    final decodedHistory = encodedHistory.map((encodedQuiz) {
      return json.decode(encodedQuiz);
    }).toList();

    // Serializa para uma lista de alternativas
    final List<AlternativeEntity> history = [];
    for (Map<String, dynamic> answeredQuiz in decodedHistory) {
      int quizId = answeredQuiz["quiz_id"];
      for (Map<String, dynamic> answeredQuestion in answeredQuiz["questions"]) {
        history.add(
          AlternativeEntity(
            alternativeId: answeredQuestion["alternative_id"],
            questionId: answeredQuestion["question_id"],
            quizId: quizId,
            title: answeredQuestion["alternative_title"],
          ),
        );
      }
    }

    return history;
  }

  @override
  Future<bool> saveRegisterInHistory(Map<String, dynamic> register) async {
    final prefs = await SharedPreferences.getInstance();

    final encodedHistory = prefs.getStringList("history") ?? [];
    encodedHistory.add(json.encode(register));

    return await prefs.setStringList("history", encodedHistory);
  }

  @override
  Future<bool> deleteHistoryRegister(int quizId) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> encodedHistory = prefs.getStringList("history") ?? [];

    final decodedHistory = encodedHistory.map((encodedQuiz) {
      return json.decode(encodedQuiz);
    }).toList();

    decodedHistory.removeWhere((registerMap) {
      return registerMap["quiz_id"] == quizId;
    });

    final newHistory = decodedHistory.map((map) {
      return json.encode(map);
    }).toList();

    return prefs.setStringList("history", newHistory);
  }
}
