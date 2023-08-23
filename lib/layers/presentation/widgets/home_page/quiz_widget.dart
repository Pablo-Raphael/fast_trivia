import 'package:checkmob_quiz/layers/domain/entities/quiz_entity.dart';
import 'package:checkmob_quiz/layers/presentation/pages/quiz_page.dart';
import 'package:checkmob_quiz/layers/presentation/pages/result_page.dart';
import 'package:flutter/material.dart';

/// Widget com as informações de um questionário disponível.
class QuizWidget extends StatelessWidget {
  const QuizWidget({Key? key, required this.quiz}) : super(key: key);

  final QuizEntity quiz;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ao clicar num questionário respondido, deve ser exibido o gabarito;
        if (quiz.isAlreadyAnswered) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResultPage(quiz: quiz),
            ),
          );
        }
        // Ao clicar num questionário não respondido, ele será iniciado;
        else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QuizPage(quiz: quiz),
            ),
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            title: Text(
              quiz.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(quiz.isAlreadyAnswered ? "Concluído" : "Incompleto"),
            trailing: quiz.isAlreadyAnswered
                ? const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check, color: Colors.black, size: 15),
                  )
                : const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}
