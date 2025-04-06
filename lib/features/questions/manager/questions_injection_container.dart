import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/questions/manager/data/datasources/questions_data_source.dart';
import 'package:aprovacao/features/questions/manager/data/repositories/questions_repository_impl.dart';
import 'package:aprovacao/features/questions/manager/domain/repositories/questions_repository.dart';
import 'package:aprovacao/features/questions/manager/domain/usecases/load_questions_use_case.dart';
import 'package:aprovacao/features/questions/manager/presentation/stores/question_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<QuestionsController>()) {
    sl.registerFactory<QuestionsController>(
      () => QuestionsController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<LoadQuestionsUsecase>()) {
    sl.registerLazySingleton<LoadQuestionsUsecase>(
      () => LoadQuestionsUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<QuestionsRepository>()) {
    sl.registerLazySingleton<QuestionsRepository>(
      () => QuestionsRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<QuestionsDataSource>()) {
    sl.registerLazySingleton<QuestionsDataSource>(
      () => QuestionsDataSourceImpl(
        api: sl(),
      ),
    );
  }

  // API
  if (!GetIt.I.isRegistered<FirestoreAPI>()) {
    sl.registerLazySingleton<FirestoreAPI>(
      () => FirestoreAPI(),
    );
  }
}
