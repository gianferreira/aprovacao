import 'package:professional_development/core/firebase/firestore/firestore_api.dart';
import 'package:professional_development/features/biome/list/data/datasources/biome_data_source.dart';
import 'package:professional_development/features/biome/list/data/repositories/biome_repository_impl.dart';
import 'package:professional_development/features/biome/list/domain/repositories/biome_repository.dart';
import 'package:professional_development/features/biome/list/domain/usecases/load_biomes_use_case.dart';
import 'package:professional_development/features/biome/list/presentation/stores/biome_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Stores
  if (!GetIt.I.isRegistered<BiomeController>()) {
    sl.registerFactory<BiomeController>(
      () => BiomeController(
        usecase: sl(),
      ),
    );
  }

  // Use cases
  if (!GetIt.I.isRegistered<LoadBiomesUsecase>()) {
    sl.registerLazySingleton<LoadBiomesUsecase>(
      () => LoadBiomesUsecase(sl()),
    );
  }
  
  // Repositories
  if (!GetIt.I.isRegistered<BiomeRepository>()) {
    sl.registerLazySingleton<BiomeRepository>(
      () => BiomeRepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  // Data sources
  if (!GetIt.I.isRegistered<BiomeDataSource>()) {
    sl.registerLazySingleton<BiomeDataSource>(
      () => BiomeDataSourceImpl(
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
