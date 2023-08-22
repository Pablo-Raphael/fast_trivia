import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/history_controller.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/home_page/quiz_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuizController _quizController = GetIt.I<QuizController>();
  final HistoryController _historyController = GetIt.I.get<HistoryController>();

  @override
  void initState() {
    super.initState();
    _historyController.loadHistory();
    _quizController.loadAllQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //
          Container(decoration: const BoxDecoration(color: Colors.deepOrange)),
          //
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: const Text(
              "Fast Trivia",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              //padding: EdgeInsets.only(top: ),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.85,
              child: Observer(
                builder: (context) {
                  return ListView(
                    children: _quizController.allQuizzes.map(
                      (QuizEntity quiz) {
                        return QuizWidget(quiz: quiz);
                      },
                    ).toList(),
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
