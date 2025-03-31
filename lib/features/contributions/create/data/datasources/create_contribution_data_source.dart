import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';

abstract class CreateContributionDataSource {
  Future<ContributionEntity> createContribution({
    required ContributionEntity contribution,
  });
}

class CreateContributionDataSourceImpl implements CreateContributionDataSource {
  final FirestoreAPI api;

  CreateContributionDataSourceImpl({
    required this.api,
  });

  @override
  Future<ContributionEntity> createContribution({
    required ContributionEntity contribution,
  }) async {
    try {
      final response = await api.createContribution(
        contribution: contribution, 
      );
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
