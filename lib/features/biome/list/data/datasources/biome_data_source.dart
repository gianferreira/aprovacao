import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/biome/list/data/models/biome_model.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';

abstract class BiomeDataSource {
  Future<List<BiomeEntity>> loadBiomes();
}

class BiomeDataSourceImpl implements BiomeDataSource {
  final FirestoreAPI api;

  BiomeDataSourceImpl({
    required this.api,
  });

  @override
  Future<List<BiomeEntity>> loadBiomes() async {
    try {
      final response = await api.getBiomes();
      
      return BiomeModel.fromList(response);
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
