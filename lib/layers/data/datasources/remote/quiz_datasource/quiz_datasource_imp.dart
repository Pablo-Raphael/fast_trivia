import 'dart:convert';
import 'package:checkmob_quiz/layers/data/datasources/remote/quiz_datasource/quiz_datasource.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:checkmob_quiz/layers/data/models/quiz_model.dart';

class QuizDataSourceImp implements QuizDataSource {
  @override
  Future<QuizModel> getQuiz(int quizId) async {
    // Simulando a requisição HTTP com um arquivo JSON mockado
    final String requestUrl = "lib/mocks/quiz_${quizId}_mock.json";
    final String request = await rootBundle.loadString(requestUrl);

    final Map<String, dynamic> response = json.decode(request);

    QuizModel quiz = QuizModel.fromJson(quizJson: response['questionario']);

    return quiz;
  }

  @override
  Future<List<int>> getAllAvailableQuizzesIds() async {
    // Simulando a requisição HTTP com um arquivo JSON mockado
    const String requestUrl = "lib/mocks/all_available_quizzes_mock.json";
    final String request = await rootBundle.loadString(requestUrl);

    final Map<String, dynamic> response = json.decode(request);

    final List<dynamic> responseList = response["available_quizzes_ids"];
    List<int> allAvailableQuizzesIds = responseList.cast<int>();

    return allAvailableQuizzesIds.toList();
  }
}
