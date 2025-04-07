import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/reset/data/datasources/reset_data_source.dart';
import 'package:aprovacao/features/reset/data/repositories/reset_repository_impl.dart';
import 'package:aprovacao/features/reset/domain/repositories/reset_repository.dart';
import 'package:aprovacao/features/reset/domain/usecases/reset_progress_use_case.dart';
import 'package:aprovacao/features/reset/presentation/stores/reset_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<ResetController>()) {
    sl.registerFactory<ResetController>(
      () => ResetController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<ResetProgressUsecase>()) {
    sl.registerLazySingleton<ResetProgressUsecase>(
      () => ResetProgressUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<ResetRepository>()) {
    sl.registerLazySingleton<ResetRepository>(
      () => ResetRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<ResetDataSource>()) {
    sl.registerLazySingleton<ResetDataSource>(
      () => ResetDataSourceImpl(
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
