// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizzesController on _QuizzesController, Store {
  late final _$allQuizzesAtom =
      Atom(name: '_QuizzesController.allQuizzes', context: context);

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
      AsyncAction('_QuizzesController.loadAllQuizzes', context: context);

  @override
  Future<void> loadAllQuizzes() {
    return _$loadAllQuizzesAsyncAction.run(() => super.loadAllQuizzes());
  }

  late final _$loadHistoryAsyncAction =
      AsyncAction('_QuizzesController.loadHistory', context: context);

  @override
  Future<void> loadHistory() {
    return _$loadHistoryAsyncAction.run(() => super.loadHistory());
  }

  late final _$_QuizzesControllerActionController =
      ActionController(name: '_QuizzesController', context: context);

  @override
  void toogleQuizAnsweredStatus(QuizEntity quiz) {
    final _$actionInfo = _$_QuizzesControllerActionController.startAction(
        name: '_QuizzesController.toogleQuizAnsweredStatus');
    try {
      return super.toogleQuizAnsweredStatus(quiz);
    } finally {
      _$_QuizzesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allQuizzes: ${allQuizzes}
    ''';
  }
}
