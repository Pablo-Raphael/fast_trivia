import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/question_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/domain/usecases/save_current_quiz_answers_usecase.dart';
import 'package:mobx/mobx.dart';

part 'quiz_controller.g.dart';

class QuizController = _QuizController with _$QuizController;

abstract class _QuizController with Store {
  late final SaveCurrentQuizAnswersUsecase _saveCurrentQuizAnswersUsecase;
  final QuizEntity currentQuiz;

  _QuizController({
    required SaveCurrentQuizAnswersUsecase saveCurrentQuizAnswersUsecase,
    required this.currentQuiz,
  }) {
    _saveCurrentQuizAnswersUsecase = saveCurrentQuizAnswersUsecase;
  }

  /// Pergunta que deve estar em foco.
  @observable
  QuestionEntity? currentQuestion;

  /// A alternativa escolhida para a pergunta em foco.
  @observable
  AlternativeEntity? currentAlternative;

  /// Alternativas que o usuário está selecionando para o questionário atual.
  @observable
  List<AlternativeEntity> quizAnswers = ObservableList<AlternativeEntity>();

  /// Altera a pergunta atual para a indicada via argumento.
  @action
  void changeCurrentQuestion({required int questionId}) {
    currentQuestion = currentQuiz.questions.firstWhere((question) {
      return question.questionId == questionId;
    });

    currentAlternative = getCurrentUserAnswer(questionId);
  }

  /// Muda o estado de uma alternativa para "selecionado".
  @action
  void selectAlternative(AlternativeEntity alternative) {
    currentAlternative = alternative;
  }

  /// Guarda a alternativa escolhida pelo usuário.
  @action
  void submitAlternative() {
    // Obtém a alternativa antes ecolhida, caso exista;
    final alternativeSubmited = quizAnswers.where((answer) {
      return answer.questionId == currentAlternative?.questionId;
    }).firstOrNull;

    // Remove a reposta anterior caso exista;
    if (alternativeSubmited != null) {
      quizAnswers.remove(alternativeSubmited);
    }

    if (currentAlternative != null) {
      quizAnswers.add(currentAlternative!);
    }
  }

  /// Salva localmente todas as alternativas escolhidas pelo usuário.
  @action
  Future<void> saveCurrentQuizAnswers() async {
    await _saveCurrentQuizAnswersUsecase(quizAnswers);
  }

  /// Status que avisa se é a última pergunta do questionário.
  @computed
  bool get isLastQuestion {
    return currentQuestion == currentQuiz.questions.lastOrNull;
  }

  /// Retorna qual opção o usuários escolheu atualmente para uma pergunta.
  AlternativeEntity? getCurrentUserAnswer(int questionId) {
    return quizAnswers.where((answer) {
      return answer.questionId == questionId;
    }).firstOrNull;
  }

  /// Retorna o objeto de uma pergunta.
  QuestionEntity getQuestionById({required int questionId}) {
    final question = currentQuiz.questions.where((question) {
      return question.questionId == questionId;
    }).first;

    return question;
  }

  /// Obtém o gabarito da pergunta.
  AlternativeEntity getCorrectAnswer(QuestionEntity question) {
    return question.alternatives.where((alternative) {
      return alternative.alternativeId == question.correctAnswer;
    }).first;
  }
}
