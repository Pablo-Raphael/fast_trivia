import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/question_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/domain/usecases/get_all_quizzes_usecase.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/history_controller.dart';
import 'package:mobx/mobx.dart';

part 'quiz_controller.g.dart';

class QuizController = _QuizController with _$QuizController;

abstract class _QuizController with Store {
  final GetAllQuizzesUsecase _getAllQuizzesUsecase;
  final HistoryController _historyController;

  _QuizController(
    this._getAllQuizzesUsecase,
    this._historyController,
  );

  @observable
  QuestionEntity? currentQuestion;

  @observable
  AlternativeEntity? currentAlternative;

  @observable
  List<QuizEntity> allQuizzes = ObservableList();

  /// Limpa o estado das perguntas e das alternativas;
  @action
  void clear() {
    currentQuestion = null;
    currentAlternative = null;
  }

  /// Altera a pergunta atual para a indicada via argumento;
  @action
  void changeCurrentQuestion({required int quizId, required int questionId}) {
    final currentQuiz = getQuizById(quizId: quizId);

    currentQuestion = currentQuiz.questions.where((question) {
      return question.questionId == questionId;
    }).first;

    currentAlternative = _historyController.getCurrentUserAnswer(questionId);
  }

  /// Muda o estado de uma alternativa para "selecionado";
  @action
  void selectAlternative(AlternativeEntity alternative) {
    currentAlternative = alternative;
  }

  /// Obtém todos os questionários disponíveis na API;.
  @action
  Future<void> loadAllQuizzes() async {
    final quizzes = await _getAllQuizzesUsecase();
    allQuizzes.clear();
    allQuizzes.addAll(quizzes);
  }

  /// Retorna o objeto de uma pergunta.
  QuestionEntity getQuestionById({required int questionId, required int quizId}) {
    final quiz = allQuizzes.where((quiz) {
      return quiz.quizId == quizId;
    }).first;

    final question = quiz.questions.where((question) {
      return question.questionId == questionId;
    }).first;

    return question;
  }

  /// Retorna o objeto de um questionário.
  QuizEntity getQuizById({required int quizId}) {
    return allQuizzes.where((quiz) {
      return quiz.quizId == quizId;
    }).first;
  }

  /// Obtém o gabarito da pergunta.
  AlternativeEntity getCorrectAnswer(QuestionEntity question) {
    return question.alternatives.where((alternative) {
      return alternative.alternativeId == question.correctAnswer;
    }).first;
  }

  /// Retorna o número de alternativas passadas por argumento que estão corretas.
  int numberOfCorrectAnswers(List<AlternativeEntity> answers) {
    int correctAnswers = 0;

    for (AlternativeEntity answer in answers) {
      // Obtém o gabarito de cada questão;
      final correctAnswer = getCorrectAnswer(
        getQuestionById(
          questionId: answer.questionId,
          quizId: answer.quizId,
        ),
      );

      // Reposta correta caso a alternativa escolhida seja a mesma do gabarito;
      if (correctAnswer.alternativeId == answer.alternativeId) {
        correctAnswers++;
      }
    }

    return correctAnswers;
  }

  /// Status que avisa se é a última pergunta do questionário.
  @computed
  bool get isLastQuestion {
    if(currentQuestion == null) return false;
    final quiz = getQuizById(quizId: currentQuestion!.quizId);
    return currentQuestion == quiz.questions.lastOrNull;
  }
}
