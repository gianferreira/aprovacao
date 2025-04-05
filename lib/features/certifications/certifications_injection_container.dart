import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/certifications/list/data/datasources/certifications_data_source.dart';
import 'package:aprovacao/features/certifications/list/data/repositories/certifications_repository_impl.dart';
import 'package:aprovacao/features/certifications/list/domain/repositories/cartifications_repository.dart';
import 'package:aprovacao/features/certifications/list/domain/usecases/load_certifications_use_case.dart';
import 'package:aprovacao/features/certifications/list/presentation/stores/certifications_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<CertificationsController>()) {
    sl.registerFactory<CertificationsController>(
      () => CertificationsController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<LoadCertificationsUsecase>()) {
    sl.registerLazySingleton<LoadCertificationsUsecase>(
      () => LoadCertificationsUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<CertificationsRepository>()) {
    sl.registerLazySingleton<CertificationsRepository>(
      () => CertificationsRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<CertificationsDataSource>()) {
    sl.registerLazySingleton<CertificationsDataSource>(
      () => CertificationsDataSourceImpl(
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
