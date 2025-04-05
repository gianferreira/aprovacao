import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';

abstract class CertificationsState {}

class CertificationsEmpty extends CertificationsState {}

class CertificationsLoading extends CertificationsState {}

class CertificationsSuccess extends CertificationsState {
  final List<CertificationEntity> certifications;

  CertificationsSuccess({
    required this.certifications,
  });
}

class CertificationsError extends CertificationsState {
  final String errorMessage;

  CertificationsError({
    required this.errorMessage,
  });
}
