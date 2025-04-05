import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/modules/list/data/datasources/modules_data_source.dart';
import 'package:aprovacao/features/modules/list/data/repositories/modules_repository_impl.dart';
import 'package:aprovacao/features/modules/list/domain/repositories/modules_repository.dart';
import 'package:aprovacao/features/modules/list/domain/usecases/load_modules_use_case.dart';
import 'package:aprovacao/features/modules/list/presentation/stores/modules_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<ModulesController>()) {
    sl.registerFactory<ModulesController>(
      () => ModulesController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<LoadModulesUsecase>()) {
    sl.registerLazySingleton<LoadModulesUsecase>(
      () => LoadModulesUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<ModulesRepository>()) {
    sl.registerLazySingleton<ModulesRepository>(
      () => ModulesRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<ModulesDataSource>()) {
    sl.registerLazySingleton<ModulesDataSource>(
      () => ModulesDataSourceImpl(
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
