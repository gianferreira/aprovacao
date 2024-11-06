import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/core/firebase/firestore/firestore_api.dart';
import 'package:professional_development/features/contributions/list/domain/entities/contributions_entity.dart';

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
