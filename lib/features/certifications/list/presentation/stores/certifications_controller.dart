import 'package:aprovacao/features/certifications/list/domain/usecases/load_certifications_use_case.dart';
import 'package:aprovacao/features/certifications/list/presentation/stores/certifications_state.dart';
import 'package:flutter/material.dart';

class CertificationsController extends ValueNotifier<CertificationsState> {
  CertificationsController({
    required this.usecase,
  }) : super(CertificationsEmpty());

  final LoadCertificationsUsecase usecase;

  void loadCertifications({
    required String userId,
  }) async {
    value = CertificationsLoading();

    final loadCertificationsResult = await usecase(LoadCertificationsParams(
      userId: userId,
    ));

    loadCertificationsResult.fold(
      (failure) {
        value = CertificationsError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = CertificationsSuccess(
          certifications: success,
        );
      },
    );
  }
}
