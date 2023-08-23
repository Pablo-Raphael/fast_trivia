// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizController on _QuizController, Store {
  Computed<bool>? _$isLastQuestionComputed;

  @override
  bool get isLastQuestion =>
      (_$isLastQuestionComputed ??= Computed<bool>(() => super.isLastQuestion,
              name: '_QuizController.isLastQuestion'))
          .value;

  late final _$currentQuestionAtom =
      Atom(name: '_QuizController.currentQuestion', context: context);

  @override
  QuestionEntity? get currentQuestion {
    _$currentQuestionAtom.reportRead();
    return super.currentQuestion;
  }

  @override
  set currentQuestion(QuestionEntity? value) {
    _$currentQuestionAtom.reportWrite(value, super.currentQuestion, () {
      super.currentQuestion = value;
    });
  }

  late final _$currentAlternativeAtom =
      Atom(name: '_QuizController.currentAlternative', context: context);

  @override
  AlternativeEntity? get currentAlternative {
    _$currentAlternativeAtom.reportRead();
    return super.currentAlternative;
  }

  @override
  set currentAlternative(AlternativeEntity? value) {
    _$currentAlternativeAtom.reportWrite(value, super.currentAlternative, () {
      super.currentAlternative = value;
    });
  }

  late final _$quizAnswersAtom =
      Atom(name: '_QuizController.quizAnswers', context: context);

  @override
  List<AlternativeEntity> get quizAnswers {
    _$quizAnswersAtom.reportRead();
    return super.quizAnswers;
  }

  @override
  set quizAnswers(List<AlternativeEntity> value) {
    _$quizAnswersAtom.reportWrite(value, super.quizAnswers, () {
      super.quizAnswers = value;
    });
  }

  late final _$saveCurrentQuizAnswersAsyncAction =
      AsyncAction('_QuizController.saveCurrentQuizAnswers', context: context);

  @override
  Future<void> saveCurrentQuizAnswers() {
    return _$saveCurrentQuizAnswersAsyncAction
        .run(() => super.saveCurrentQuizAnswers());
  }

  late final _$_QuizControllerActionController =
      ActionController(name: '_QuizController', context: context);

  @override
  void changeCurrentQuestion({required int questionId}) {
    final _$actionInfo = _$_QuizControllerActionController.startAction(
        name: '_QuizController.changeCurrentQuestion');
    try {
      return super.changeCurrentQuestion(questionId: questionId);
    } finally {
      _$_QuizControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectAlternative(AlternativeEntity alternative) {
    final _$actionInfo = _$_QuizControllerActionController.startAction(
        name: '_QuizController.selectAlternative');
    try {
      return super.selectAlternative(alternative);
    } finally {
      _$_QuizControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submitAlternative() {
    final _$actionInfo = _$_QuizControllerActionController.startAction(
        name: '_QuizController.submitAlternative');
    try {
      return super.submitAlternative();
    } finally {
      _$_QuizControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentQuestion: ${currentQuestion},
currentAlternative: ${currentAlternative},
quizAnswers: ${quizAnswers},
isLastQuestion: ${isLastQuestion}
    ''';
  }
}
