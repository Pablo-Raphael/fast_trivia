import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/usecases/delete_history_register_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/load_history_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/save_current_quiz_answers_usecase.dart';
import 'package:mobx/mobx.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryController with _$HistoryController;

abstract class _HistoryController with Store {
  final LoadHistoryUsecase _getHistoryUsecase;
  final SaveCurrentQuizAnswersUsecase _saveCurrentQuizAnswersUsecase;
  final DeleteHistoryRegisterUsecase _deleteHistoryRegisterUsecase;

  _HistoryController(
    this._getHistoryUsecase,
    this._saveCurrentQuizAnswersUsecase,
    this._deleteHistoryRegisterUsecase,
  );

  @observable
  List<AlternativeEntity> currentQuizAnswers = ObservableList<AlternativeEntity>();

  @observable
  List<AlternativeEntity> history = ObservableList<AlternativeEntity>();

  /// Carrega o histórico completo de alternativas que o usuário escolheu em
  /// todos os questionários.
  @action
  Future<void> loadHistory() async {
    final newHistory = await _getHistoryUsecase();
    history.clear();
    history.addAll(newHistory);
  }

  /// Limpa as informações sobre as alternativas escolhidas pelo usuário
  /// durante a realização de um questionário.
  @action
  void clear() {
    currentQuizAnswers.clear();
  }

  /// Organiza as alternativas do usuário em ordem crescente de ID.
  @action
  void sortCurrentQuizAnswers() {
    currentQuizAnswers.sort((a, b) => a.questionId.compareTo(b.questionId));
  }

  /// Salva localmente todas as alternativas escolhidas pelo usuário
  @action
  Future<void> saveCurrentQuizAnswers() async {
    await _saveCurrentQuizAnswersUsecase(currentQuizAnswers);
  }

  /// Diz se um quiz já foi respondido ou não.
  bool isQuizAlreadyAnswered(int quizId) {
    for (AlternativeEntity alternative in history) {
      if (alternative.quizId == quizId) {
        return true;
      }
    }

    return false;
  }

  /// Guarda a alternativa escolhida pelo usuário.
  @action
  void submitAlternative(AlternativeEntity alternative) {
    // Verifica se a questão já foi respondida;
    final alternativeSubmited = currentQuizAnswers.where((answer) {
      return answer.questionId == alternative.questionId;
    }).firstOrNull;

    // Remove a reposta anterior caso exista;
    if (alternativeSubmited != null) {
      currentQuizAnswers.remove(alternativeSubmited);
    }

    currentQuizAnswers.add(alternative);
  }

  /// Retorna qual opção o usuários escolheu atualmente para uma pergunta.
  AlternativeEntity? getCurrentUserAnswer(int questionId) {
    return currentQuizAnswers.where((answer) {
      return answer.questionId == questionId;
    }).firstOrNull;
  }

  /// Obterá todas as respostas do usuário a um questionário específico.
  List<AlternativeEntity> getQuizHistory(int quizId) {
    return history.where((alternative) {
      return alternative.quizId == quizId;
    }).toList();
  }

  /// Apagará o registro de respostas de um questionário específico.
  /// Retorna um booleano indicando sucesso ou falha.
  Future<bool> deleteHistoryRegisterUsecase(int questionId) async {
    return _deleteHistoryRegisterUsecase(questionId);
  }
}
