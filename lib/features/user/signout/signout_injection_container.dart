import 'package:aprovacao/core/firebase/authentication/auth_api.dart';
import 'package:aprovacao/features/user/signout/data/datasources/signout_data_source.dart';
import 'package:aprovacao/features/user/signout/data/repositories/signout_repository_impl.dart';
import 'package:aprovacao/features/user/signout/domain/repositories/signout_repository.dart';
import 'package:aprovacao/features/user/signout/domain/usecases/signout_use_case.dart';
import 'package:aprovacao/features/user/signout/presentation/stores/signout_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<SignoutController>()) {
    sl.registerFactory<SignoutController>(
      () => SignoutController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<SignoutUsecase>()) {
    sl.registerLazySingleton<SignoutUsecase>(
      () => SignoutUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<SignoutRepository>()) {
    sl.registerLazySingleton<SignoutRepository>(
      () => SignoutRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<SignoutDataSource>()) {
    sl.registerLazySingleton<SignoutDataSource>(
      () => SignoutDataSourceImpl(
        api: sl(),
      ),
    );
  }

  // API
  if (!GetIt.I.isRegistered<AuthAPI>()) {
    sl.registerLazySingleton<AuthAPI>(
      () => AuthAPI(),
    );
  }
}
