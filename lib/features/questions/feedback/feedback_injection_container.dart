import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/questions/feedback/data/datasources/feedback_data_source.dart';
import 'package:aprovacao/features/questions/feedback/data/repositories/feedback_repository_impl.dart';
import 'package:aprovacao/features/questions/feedback/domain/repositories/feedback_repository.dart';
import 'package:aprovacao/features/questions/feedback/domain/usecases/send_feedback_user_case.dart';
import 'package:aprovacao/features/questions/feedback/presentation/stores/feedback_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<FeedbackController>()) {
    sl.registerFactory<FeedbackController>(
      () => FeedbackController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<SendFeedbackUsecase>()) {
    sl.registerLazySingleton<SendFeedbackUsecase>(
      () => SendFeedbackUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<FeedbackRepository>()) {
    sl.registerLazySingleton<FeedbackRepository>(
      () => FeedbackRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<FeedbackDataSource>()) {
    sl.registerLazySingleton<FeedbackDataSource>(
      () => FeedbackDataSourceImpl(
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
