import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/contributions/list/data/datasources/contributions_data_source.dart';
import 'package:aprovacao/features/contributions/list/data/repositories/contributions_repository_impl.dart';
import 'package:aprovacao/features/contributions/list/domain/repositories/contributions_repository.dart';
import 'package:aprovacao/features/contributions/list/domain/usecases/load_contributions_use_case.dart';
import 'package:aprovacao/features/contributions/list/presentation/stores/contributions_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<ContributionController>()) {
    sl.registerFactory<ContributionController>(
      () => ContributionController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<LoadContributionsUsecase>()) {
    sl.registerLazySingleton<LoadContributionsUsecase>(
      () => LoadContributionsUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<ContributionRepository>()) {
    sl.registerLazySingleton<ContributionRepository>(
      () => ContributionRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<ContributionDataSource>()) {
    sl.registerLazySingleton<ContributionDataSource>(
      () => ContributionDataSourceImpl(
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
