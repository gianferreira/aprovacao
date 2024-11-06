import 'package:professional_development/core/firebase/firestore/firestore_api.dart';
import 'package:professional_development/features/contributions/create/data/datasources/create_contribution_data_source.dart';
import 'package:professional_development/features/contributions/create/data/repositories/create_contribution_repository_impl.dart';
import 'package:professional_development/features/contributions/create/domain/repositories/create_contribution_repository.dart';
import 'package:professional_development/features/contributions/create/domain/usecases/create_contribution_use_case.dart';
import 'package:professional_development/features/contributions/create/presentation/stores/create_contribution_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<CreateContributionController>()) {
    sl.registerFactory<CreateContributionController>(
      () => CreateContributionController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<CreateContributionUsecase>()) {
    sl.registerLazySingleton<CreateContributionUsecase>(
      () => CreateContributionUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<CreateContributionRepository>()) {
    sl.registerLazySingleton<CreateContributionRepository>(
      () => CreateContributionRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<CreateContributionDataSource>()) {
    sl.registerLazySingleton<CreateContributionDataSource>(
      () => CreateContributionDataSourceImpl(
        api: sl(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<FirestoreAPI>()) {
    sl.registerLazySingleton<FirestoreAPI>(
      () => FirestoreAPI(),
    );
  }
}
