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

  late final _$allQuizzesAtom =
      Atom(name: '_QuizController.allQuizzes', context: context);

  @override
  List<QuizEntity> get allQuizzes {
    _$allQuizzesAtom.reportRead();
    return super.allQuizzes;
  }

  @override
  set allQuizzes(List<QuizEntity> value) {
    _$allQuizzesAtom.reportWrite(value, super.allQuizzes, () {
      super.allQuizzes = value;
    });
  }

  late final _$loadAllQuizzesAsyncAction =
      AsyncAction('_QuizController.loadAllQuizzes', context: context);

  @override
  Future<void> loadAllQuizzes() {
    return _$loadAllQuizzesAsyncAction.run(() => super.loadAllQuizzes());
  }

  late final _$_QuizControllerActionController =
      ActionController(name: '_QuizController', context: context);

  @override
  void clear() {
    final _$actionInfo = _$_QuizControllerActionController.startAction(
        name: '_QuizController.clear');
    try {
      return super.clear();
    } finally {
      _$_QuizControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentQuestion({required int quizId, required int questionId}) {
    final _$actionInfo = _$_QuizControllerActionController.startAction(
        name: '_QuizController.changeCurrentQuestion');
    try {
      return super
          .changeCurrentQuestion(quizId: quizId, questionId: questionId);
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
  String toString() {
    return '''
currentQuestion: ${currentQuestion},
currentAlternative: ${currentAlternative},
allQuizzes: ${allQuizzes},
isLastQuestion: ${isLastQuestion}
    ''';
  }
}
