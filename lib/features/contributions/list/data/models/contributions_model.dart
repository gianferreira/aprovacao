import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';

class ContributionModel extends ContributionEntity {
  ContributionModel({
    required String? id,
    required String? userId,
    required String? userName,
    required String? biomeId,
    required String? title,
    required String? description,
  }) : super(
    id: id ?? '',
    userId: userId ?? '',
    userName: userName ?? '',
    biomeId: biomeId ?? '',
    title: title ?? '',
    description: description ?? '',
  );

  factory ContributionModel.fromJson(Map<String, dynamic> json) {
    return ContributionModel(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      biomeId: json['biomeId'],
      title: json['title'],
      description: json['description'],
    );
  }

  static List<ContributionEntity> fromList(List<Map<String, dynamic>> json) {
    final contributions = <ContributionEntity>[];

    for (Map<String, dynamic> item in json) {
      contributions.add(ContributionModel.fromJson(item));
    }

    return contributions;
  }

  static Map<String, dynamic> toJson(ContributionEntity contribution) {
    return {
      'biomeId': contribution.biomeId,
      'date': DateTime.now(),
      'description': contribution.description,
      'id': contribution.id,
      'title': contribution.title,
      'userId': contribution.userId,
      'userName': contribution.userName,
    };
  }
}
