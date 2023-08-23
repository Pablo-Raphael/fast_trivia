import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quizzes_controller.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/result_page/circular_quiz_result_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/result_page/correction_card_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/result_page/redo_quiz_button_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/result_page/total_score_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.quiz}) : super(key: key);

  final QuizEntity quiz;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final QuizzesController _quizzesController = GetIt.I.get<QuizzesController>();
  late final List<AlternativeEntity> history;
  late final int numberOfCorrectAnswers;

  @override
  void initState() {
    super.initState();
    history = _quizzesController.getQuizHistory(widget.quiz.quizId);

    numberOfCorrectAnswers = _quizzesController.numberOfCorrectAnswers(
      history,
      widget.quiz,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.quiz.title,
          textScaleFactor: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          //
          CircularQuizResult(
            numberOfCorrectAnswers: numberOfCorrectAnswers,
            totalNumberOfQuestions: widget.quiz.questions.length,
          ),
          //
          TotalScoresTextWidget(
            numberOfCorrectAnswers: numberOfCorrectAnswers,
            totalNumberOfQuestions: widget.quiz.questions.length,
          ),
          //
          ...widget.quiz.questions.map(
            (question) {
              return CorrectionCardWidget(
                question: question,
                userAnswer: history.where((alternative) {
                  return alternative.questionId == question.questionId;
                }).first,
              );
            },
          ).toList(),
          //
          RedoQuizButtonWidget(quiz: widget.quiz),
        ],
      ),
    );
  }
}
