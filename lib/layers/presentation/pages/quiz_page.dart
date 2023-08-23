import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/quiz_page/alternatives/alternatives_card_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/quiz_page/questions/current_question_title_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/quiz_page/questions/questions_indicator_widget.dart';
import 'package:checkmob_quiz/layers/presentation/widgets/quiz_page/buttons/submit_alternative_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({required this.quiz, Key? key}) : super(key: key);

  final QuizEntity quiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    // Cada sessão de respostas a um questionário deve ter um controlador único;
    final quizController = QuizController(
      saveCurrentQuizAnswersUsecase: GetIt.I.get(),
      currentQuiz: widget.quiz,
    );

    GetIt.I.registerSingleton<QuizController>(quizController);

    // Ao abrir um questionário, traz o foco à primeira pergunta;
    quizController.changeCurrentQuestion(questionId: 1);
  }

  @override
  void dispose() {
    // Se encerrar um questionário, encerra seu respectivo controlador também;
    GetIt.I.unregister<QuizController>();
    super.dispose();
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
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //
      body: Stack(
        children: [
          //
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80),
                bottomLeft: Radius.circular(80),
              ),
            ),
          ),
          //
          ListView(
            children: [
              //
              QuestionsIndicatorWidget(quiz: widget.quiz),
              //
              CurrentQuestionTitleWidget(),
              //
              AlternativesCardWidget(),
              //
              SubmitAlternativeButtonWidget(quiz: widget.quiz),
            ],
          )
        ],
      ),
    );
  }
}
