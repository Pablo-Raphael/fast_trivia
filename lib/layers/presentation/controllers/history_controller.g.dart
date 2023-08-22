// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryController, Store {
  late final _$currentQuizAnswersAtom =
      Atom(name: '_HistoryController.currentQuizAnswers', context: context);

  @override
  List<AlternativeEntity> get currentQuizAnswers {
    _$currentQuizAnswersAtom.reportRead();
    return super.currentQuizAnswers;
  }

  @override
  set currentQuizAnswers(List<AlternativeEntity> value) {
    _$currentQuizAnswersAtom.reportWrite(value, super.currentQuizAnswers, () {
      super.currentQuizAnswers = value;
    });
  }

  late final _$historyAtom =
      Atom(name: '_HistoryController.history', context: context);

  @override
  List<AlternativeEntity> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(List<AlternativeEntity> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$loadHistoryAsyncAction =
      AsyncAction('_HistoryController.loadHistory', context: context);

  @override
  Future<void> loadHistory() {
    return _$loadHistoryAsyncAction.run(() => super.loadHistory());
  }

  late final _$saveCurrentQuizAnswersAsyncAction = AsyncAction(
      '_HistoryController.saveCurrentQuizAnswers',
      context: context);

  @override
  Future<void> saveCurrentQuizAnswers() {
    return _$saveCurrentQuizAnswersAsyncAction
        .run(() => super.saveCurrentQuizAnswers());
  }

  late final _$_HistoryControllerActionController =
      ActionController(name: '_HistoryController', context: context);

  @override
  void clear() {
    final _$actionInfo = _$_HistoryControllerActionController.startAction(
        name: '_HistoryController.clear');
    try {
      return super.clear();
    } finally {
      _$_HistoryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortCurrentQuizAnswers() {
    final _$actionInfo = _$_HistoryControllerActionController.startAction(
        name: '_HistoryController.sortCurrentQuizAnswers');
    try {
      return super.sortCurrentQuizAnswers();
    } finally {
      _$_HistoryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submitAlternative(AlternativeEntity alternative) {
    final _$actionInfo = _$_HistoryControllerActionController.startAction(
        name: '_HistoryController.submitAlternative');
    try {
      return super.submitAlternative(alternative);
    } finally {
      _$_HistoryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentQuizAnswers: ${currentQuizAnswers},
history: ${history}
    ''';
  }
}
