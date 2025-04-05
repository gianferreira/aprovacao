import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';

class CertificationModel extends CertificationEntity {
  CertificationModel({
    required String? id,
    required String? title,
    required String? subtitle,
    required int? modulesAmount,
    required bool? available,
    required int? expiresIn,
    required String? userId,      
  }) : super(
    id: id ?? '',
    title: title ?? '',
    subtitle: subtitle ?? '',
    modulesAmount: modulesAmount ?? 0,
    available: available ?? false,
    expiresIn: expiresIn ?? 0,
    userId: userId ?? '',
  );

  factory CertificationModel.fromJson({
    required Map<String, dynamic> userCertification,
    required Map<String, dynamic> certification,
  }) {
    return CertificationModel(
      id: certification['id'],
      title: certification['title'],
      subtitle: certification['subtitle'],
      modulesAmount: certification['modulesAmount'],
      available: userCertification['available'],
      expiresIn: userCertification['expiresIn'],
      userId: userCertification['user_id'],
    );
  }

  static List<CertificationEntity> fromDataBase({
    required CertificationsSnapshots snapshots,
  }) {
    final certifications = <CertificationEntity>[];

    final userCertificationsDocs = snapshots.userCertifications;
    final certificationsDocs = snapshots.certifications;

    for (int index = 0; index < userCertificationsDocs.length; index++) {
      certifications.add(CertificationModel.fromJson(
        userCertification: userCertificationsDocs[index],
        certification: certificationsDocs[index],
      ));
    }

    return certifications;
  }
}
