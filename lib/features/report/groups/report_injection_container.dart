import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/report/groups/data/datasources/report_data_source.dart';
import 'package:aprovacao/features/report/groups/data/repositories/report_repository_impl.dart';
import 'package:aprovacao/features/report/groups/domain/repositories/report_repository.dart';
import 'package:aprovacao/features/report/groups/domain/usecases/generate_report_use_case.dart';
import 'package:aprovacao/features/report/groups/presentation/stores/report_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<ReportController>()) {
    sl.registerFactory<ReportController>(
      () => ReportController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<GenerateReportUsecase>()) {
    sl.registerLazySingleton<GenerateReportUsecase>(
      () => GenerateReportUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<ReportRepository>()) {
    sl.registerLazySingleton<ReportRepository>(
      () => ReportRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<ReportDataSource>()) {
    sl.registerLazySingleton<ReportDataSource>(
      () => ReportDataSourceImpl(
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
