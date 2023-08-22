import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/history_controller.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:checkmob_quiz/layers/presentation/pages/home_page.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/result_page/circular_quiz_result_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/result_page/correction_card_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/result_page/redo_quiz_button_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/result_page/total_score_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key, required this.quiz}) : super(key: key);

  final QuizController _quizController = GetIt.I.get<QuizController>();
  final HistoryController _historyController = GetIt.I.get<HistoryController>();
  final QuizEntity quiz;

  @override
  Widget build(BuildContext context) {
    final totalNumberOfQuestions = quiz.questions.length;
    final quizHistory = _historyController.getQuizHistory(quiz.quizId);
    final numberOfCorrectAnswers =
        _quizController.numberOfCorrectAnswers(quizHistory);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            color: Colors.white,
          ),
        ),
        title: Text(
          quiz.title,
          textScaleFactor: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          return true;
        },
        child: ListView(
          children: <Widget>[
            //
            CircularQuizResult(
              numberOfCorrectAnswers: numberOfCorrectAnswers,
              totalNumberOfQuestions: totalNumberOfQuestions,
            ),
            //
            TotalScoresTextWidget(
              numberOfCorrectAnswers: numberOfCorrectAnswers,
              totalNumberOfQuestions: totalNumberOfQuestions,
            ),
            //
            ..._historyController.history
                .where((alternative) => alternative.quizId == quiz.quizId)
                .map(
              (alternative) {
                return CorrectionCardWidget(
                  userAnswer: alternative,
                  question: _quizController.getQuestionById(
                    questionId: alternative.questionId,
                    quizId: alternative.quizId,
                  ),
                );
              },
            ).toList(),
            //
            RedoQuizButtonWidget(quiz: quiz),
          ],
        ),
      ),
    );
  }
}
