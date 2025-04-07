import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/reset/domain/usecases/reset_progress_use_case.dart';
import 'package:aprovacao/features/reset/presentation/stores/reset_state.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ResetController extends ValueNotifier<ResetState> {
  ResetController({
    required this.usecase,
  }) : super(ResetEmpty());

  final ResetProgressUsecase usecase;

  void resetProgress({
    required UserEntity user,
    required CertificationEntity certification,
  }) async {
    value = ResetLoading();

    final resetProgressResult = await usecase(ResetProgressParams(
      userId: user.id,
      certificationId: certification.id,
    ));

    resetProgressResult.fold(
      (failure) {
        value = ResetError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = ResetSuccess();
      },
    );
  }
}
