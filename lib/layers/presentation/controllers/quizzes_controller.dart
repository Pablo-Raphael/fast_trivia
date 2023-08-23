import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/question_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/domain/usecases/delete_history_register_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/get_all_quizzes_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/get_quiz_history_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/load_history_usecase.dart';
import 'package:mobx/mobx.dart';

part 'quizzes_controller.g.dart';

class QuizzesController = _QuizzesController with _$QuizzesController;

abstract class _QuizzesController with Store {
  final LoadHistoryUsecase _loadHistoryUsecase;
  final DeleteHistoryRegisterUsecase _deleteHistoryRegisterUsecase;
  final GetAllQuizzesUsecase _getAllQuizzesUsecase;
  final GetQuizHistoryUsecase _getQuizHistoryUsecase;

  _QuizzesController(
    this._loadHistoryUsecase,
    this._deleteHistoryRegisterUsecase,
    this._getAllQuizzesUsecase,
    this._getQuizHistoryUsecase,
  );

  /// Todos os questionários obtidos do servidor.
  @observable
  List<QuizEntity> allQuizzes = ObservableList();

  /// Obtém e armazena todos os questionários disponíveis no servidor.
  @action
  Future<void> loadAllQuizzes() async {
    final List<QuizEntity> quizzes = await _getAllQuizzesUsecase();

    allQuizzes.clear();
    allQuizzes.addAll(quizzes);
  }

  /// Carrega o histórico completo de alternativas que o usuário escolheu em
  /// todos os questionários.
  @action
  Future<void> loadHistory() async {
    await _loadHistoryUsecase();
  }

  /// Inverte o status de conclusão de um questionário.
  @action
  void toogleQuizAnsweredStatus(QuizEntity quiz) {
    final quizIndex = allQuizzes.indexOf(quiz);
    allQuizzes.remove(quiz);
    quiz.isAlreadyAnswered = !quiz.isAlreadyAnswered;
    allQuizzes.insert(quizIndex, quiz);
  }

  /// Obterá todas as respostas do usuário a um questionário específico.
  List<AlternativeEntity> getQuizHistory(int quizId) {
    return _getQuizHistoryUsecase(quizId);
  }

  /// Apagará o registro de respostas de um questionário específico.
  /// Retorna um booleano indicando sucesso ou falha.
  Future<bool> deleteHistoryRegisterUsecase(int questionId) async {
    return _deleteHistoryRegisterUsecase(questionId);
  }

  /// Retorna o número de alternativas corretas passadas por argumento.
  int numberOfCorrectAnswers(List<AlternativeEntity> answers, QuizEntity quiz) {
    int numberOfCorrectAnswers = 0;

    for (AlternativeEntity answer in answers) {
      final QuestionEntity question = quiz.questions.firstWhere((question) {
        return question.questionId == answer.questionId;
      });

      if (question.correctAnswer == answer.alternativeId) {
        numberOfCorrectAnswers++;
      }
    }

    return numberOfCorrectAnswers;
  }
}
