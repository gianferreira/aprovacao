import 'package:aprovacao/core/navigation/arguments/biome_args.dart';
import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/snacknar/biome_snackbar_error.dart';
import 'package:aprovacao/core/widgets/snacknar/biome_snackbar_success.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/contributions/create/presentation/stores/create_contribution_controller.dart';
import 'package:aprovacao/features/contributions/create/presentation/stores/create_contribution_state.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class CreateContributionHandler extends StatelessWidget {
  const CreateContributionHandler({
    super.key,
    required this.formKey,
    required this.descriptionController,
    required this.titleController,
    required this.createContributionController,
    required this.biome,
    required this.user,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController descriptionController;
  final TextEditingController titleController;
  final CreateContributionController createContributionController;
  final BiomeEntity biome;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CreateContributionState>(
      valueListenable: createContributionController,
      builder: (context, state, child) {
        if(state is CreateContributionSuccess) {
          DevProSnackBarSuccess.show(
            context: context,
            title: 'Contribuição criada com sucesso!',
          );

          DevProNavigatorBuilder.pushReplacement(
            context: context, 
            routeName: Routes.biomesDetails,
            args: BiomeArgs(
              user: user,
              biome: biome
            ),
          );
        } else if(state is CreateContributionError) {
          DevProSnackBarError.show(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: FilledButton(
            onPressed: () {
              if(formKey.currentState?.validate() ?? false) {
                createContributionController.createContribution(
                  biome: biome,
                  user: user,
                  description: descriptionController.text,
                  title: titleController.text,
                );
              }
            },
            child: state is CreateContributionLoading
              ? SizedBox(
                  height: 14.0,
                  width: 14.0,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.background,
                  ),
                )
              : const Text('Concluir'),
          ),
        );
      }
    );
  }
}
