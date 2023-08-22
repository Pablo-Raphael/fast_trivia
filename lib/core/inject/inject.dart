import 'package:checkmob_quiz/layers/data/datasources/local/user_history_datasource/history_datasource.dart';
import 'package:checkmob_quiz/layers/data/datasources/local/user_history_datasource/history_datasource_imp.dart';
import 'package:checkmob_quiz/layers/data/datasources/remote/quiz_datasource/quiz_datasource.dart';
import 'package:checkmob_quiz/layers/data/datasources/remote/quiz_datasource/quiz_datasource_imp.dart';
import 'package:checkmob_quiz/layers/data/repositories/history_repository_imp.dart';
import 'package:checkmob_quiz/layers/data/repositories/quiz_repository_imp.dart';
import 'package:checkmob_quiz/layers/domain/repositories/history_repository.dart';
import 'package:checkmob_quiz/layers/domain/repositories/quiz_repository.dart';
import 'package:checkmob_quiz/layers/domain/usecases/delete_history_register_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/get_all_quizzes_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/load_history_usecase.dart';
import 'package:checkmob_quiz/layers/domain/usecases/save_current_quiz_answers_usecase.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/history_controller.dart';
import 'package:checkmob_quiz/layers/presentation/controllers/quiz_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;
    
    // DataSources
    getIt.registerLazySingleton<QuizDataSource>(() => QuizDataSourceImp());
    getIt.registerLazySingleton<HistoryDataSource>(() => HistoryDataSourceImp());
    
    // Repositories
    getIt.registerLazySingleton<QuizRepository>(() => QuizRepositoryImp(getIt()));
    getIt.registerLazySingleton<HistoryRepository>(() => HistoryRepositoryImp(getIt()));

    // UseCases
    getIt.registerLazySingleton<GetAllQuizzesUsecase>(() => GetAllQuizzesUsecase(getIt()));
    getIt.registerLazySingleton<LoadHistoryUsecase>(() => LoadHistoryUsecase(getIt()));
    getIt.registerLazySingleton<SaveCurrentQuizAnswersUsecase>(() => SaveCurrentQuizAnswersUsecase(getIt()));
    getIt.registerLazySingleton<DeleteHistoryRegisterUsecase>(() => DeleteHistoryRegisterUsecase(getIt()));

    // Controllers
    getIt.registerLazySingleton<QuizController>(() => QuizController(getIt(), getIt()));
    getIt.registerLazySingleton<HistoryController>(() => HistoryController(getIt(), getIt(), getIt()));
  }
}