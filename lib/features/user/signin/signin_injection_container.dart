import 'package:aprovacao/core/firebase/authentication/auth_api.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/user/signin/data/datasources/signin_data_source.dart';
import 'package:aprovacao/features/user/signin/data/repositories/signin_repository_impl.dart';
import 'package:aprovacao/features/user/signin/domain/repositories/signin_repository.dart';
import 'package:aprovacao/features/user/signin/domain/usecases/signin_use_case.dart';
import 'package:aprovacao/features/user/signin/presentation/stores/signin_controller.dart';
import 'package:aprovacao/features/user/signup/data/datasources/user_data_source.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<SignInController>()) {
    sl.registerFactory<SignInController>(
      () => SignInController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<SignInUsecase>()) {
    sl.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<SignInRepository>()) {
    sl.registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImpl(
        signInDataSource: sl(),
        userDataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<SignInDataSource>()) {
    sl.registerLazySingleton<SignInDataSource>(
      () => SignInDataSourceImpl(
        api: sl(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<UserDataSource>()) {
    sl.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(
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

  if (!GetIt.I.isRegistered<FirestoreAPI>()) {
    sl.registerLazySingleton<FirestoreAPI>(
      () => FirestoreAPI(),
    );
  }
}
