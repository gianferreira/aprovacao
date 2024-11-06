import 'package:professional_development/core/firebase/authentication/auth_api.dart';
import 'package:professional_development/core/firebase/firestore/firestore_api.dart';
import 'package:professional_development/features/user/signup/domain/usecases/sign_use_case.dart';
import 'package:professional_development/features/user/signup/data/datasources/auth_data_source.dart';
import 'package:professional_development/features/user/signup/data/datasources/user_data_source.dart';
import 'package:professional_development/features/user/signup/data/repositories/signup_repository_impl.dart';
import 'package:professional_development/features/user/signup/domain/repositories/signup_repository.dart';
import 'package:professional_development/features/user/signup/presentation/stores/signup_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<SignUpController>()) {
    sl.registerFactory<SignUpController>(
      () => SignUpController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<SignUsecase>()) {
    sl.registerLazySingleton<SignUsecase>(
      () => SignUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<SignUpRepository>()) {
    sl.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(
        authDataSource: sl(),
        userDataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<AuthDataSource>()) {
    sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(
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
