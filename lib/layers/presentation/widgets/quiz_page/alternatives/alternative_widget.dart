import 'package:checkmob_quiz/layers/domain/entities/alternative_entity.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

/// Widget de cada alternativa disponível para uma pergunta.
class AlternativeWidget extends StatelessWidget {
  AlternativeWidget({required this.alternative, Key? key}) : super(key: key);

  final AlternativeEntity alternative;
  final QuizController _quizController = GetIt.I.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: MediaQuery.of(context).size.height * 0.012,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: _quizController.currentAlternative?.alternativeId == alternative.alternativeId
                  ? Colors.deepOrange
                  : Colors.grey,
              width: 1.2,
            ),
          ),
          child: GestureDetector(
            onTap: () => _quizController.selectAlternative(alternative),
            child: ListTile(
              title: Text("${alternative.alternativeId}. ${alternative.title}"),
              tileColor: _quizController.currentAlternative?.alternativeId == alternative.alternativeId
                  ? Colors.orange.withAlpha(50)
                  : null,
            ),
          ),
        );
      },
    );
  }
}
