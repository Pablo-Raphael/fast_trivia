import 'package:checkmob_quiz/layers/data/datasources/local/user_history_datasource/quiz_local_datasource.dart';
import 'package:checkmob_quiz/layers/data/datasources/local/user_history_datasource/quiz_local_datasource_imp.dart';
import 'package:checkmob_quiz/layers/data/datasources/remote/quiz_remote_datasource/quiz_remote_datasource.dart';
import 'package:checkmob_quiz/layers/data/datasources/remote/quiz_remote_datasource/quiz_remote_datasource_imp.dart';
import 'package:checkmob_quiz/layers/data/repositories/quiz_repository_imp.dart';
import 'package:checkmob_quiz/layers/domain/repositories/quizzes_repository.dart';
import 'package:checkmob_quiz/layers/domain/usecases/delete_history_register_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/get_all_quizzes_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/get_quiz_history_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/load_history_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/save_current_quiz_answers_usecase.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quizzes_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // DataSources
    getIt.registerLazySingleton<QuizLocalDataSource>(() => QuizLocalDataSourceImp());
    getIt.registerLazySingleton<QuizRemoteDataSource>(() => QuizRemoteDataSourceImp());

    // Repositories
    getIt.registerLazySingleton<QuizzesRepository>(
      () => QuizzesRepositoryImp(
        quizLocalDataSource: getIt(),
        quizRemoteDataSource: getIt(),
      ),
    );

    // UseCases
    getIt.registerLazySingleton<GetAllQuizzesUsecase>(() => GetAllQuizzesUsecase(getIt()));
    getIt.registerLazySingleton<LoadHistoryUsecase>(() => LoadHistoryUsecase(getIt()));
    getIt.registerLazySingleton<SaveCurrentQuizAnswersUsecase>(() => SaveCurrentQuizAnswersUsecase(getIt()));
    getIt.registerLazySingleton<DeleteHistoryRegisterUsecase>(() => DeleteHistoryRegisterUsecase(getIt()));
    getIt.registerLazySingleton<GetQuizHistoryUsecase>(() => GetQuizHistoryUsecase(getIt()));

    // Controllers
    getIt.registerLazySingleton<QuizzesController>(() => QuizzesController(getIt(), getIt(), getIt(), getIt()));
  }
}
