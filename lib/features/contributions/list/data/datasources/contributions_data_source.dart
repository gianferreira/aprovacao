import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/contributions/list/data/models/contributions_model.dart';
import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';

abstract class ContributionDataSource {
  Future<List<ContributionEntity>> loadContributionsFromBiome({
    required String id,
  });
}

class ContributionDataSourceImpl implements ContributionDataSource {
  final FirestoreAPI api;

  ContributionDataSourceImpl({
    required this.api,
  });

  @override
  Future<List<ContributionEntity>> loadContributionsFromBiome({
    required String id,
  }) async {
    try {
      final response = await api.getContributionsFromBiome(
        biomeId: id,
      );
      
      return ContributionModel.fromList(response);
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
 