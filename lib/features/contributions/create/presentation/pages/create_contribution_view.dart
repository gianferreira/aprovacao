import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/contributions/create/presentation/stores/create_contribution_controller.dart';
import 'package:aprovacao/features/contributions/create/presentation/widgets/create_contribution_form.dart';
import 'package:aprovacao/features/contributions/create/presentation/widgets/create_contribution_handler.dart';
import 'package:aprovacao/features/contributions/create/presentation/widgets/create_contribution_header.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/contributions/create/create_contribution_injection_container.dart' as create_contribution_dependencies;

class CreateContributionView extends StatefulWidget {
  const CreateContributionView({
    super.key,
    required this.biome,
    required this.user,
  });

  final BiomeEntity biome;
  final UserEntity user;

  @override
  State<CreateContributionView> createState() => _CreateContributionViewState();
}

class _CreateContributionViewState extends State<CreateContributionView> {
  late CreateContributionController createContributionController;

  late GlobalKey<FormState> formKey;
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    createContributionController = create_contribution_dependencies.sl<CreateContributionController>();

    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    descriptionController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    createContributionController.dispose();

    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => AprovacaoNavigator.pop(
            context: context,
          ),
        ),
        title: const Text(
          'Adicionar contribuição',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CreateContributionHeader(
              biomeName: widget.biome.name,
            ),
            const SizedBox(height: 24.0),
            CreateContributionForm(
              formKey: formKey,
              descriptionController: descriptionController,
              titleController: titleController,
            ),
            const Spacer(),
            CreateContributionHandler(
              formKey: formKey,
              createContributionController: createContributionController,
              titleController: titleController,
              descriptionController: descriptionController,
              biome: widget.biome,
              user: widget.user,
            ),
          ],
        ),
      ),
    );
  }
}
