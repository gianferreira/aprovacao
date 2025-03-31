import 'package:aprovacao/core/validators/field_validators.dart';
import 'package:aprovacao/core/widgets/text_fields/text_form_field.dart';
import 'package:flutter/material.dart';

class CreateContributionForm extends StatelessWidget with BiomeFormValidations {
  const CreateContributionForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          BiomeTextFormField(
            label: 'Título',
            hintText: 'Título da contribuição',
            maxLines: 1,
            minLines: 1,
            textFieldController: titleController,
            textInputAction: TextInputAction.next,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => hasMultipleWords(value),
            ]),
          ),
          const SizedBox(height: 24.0),
          BiomeTextFormField(
            label: 'Descrição',
            hintText: 'Descrição da contribuição',
            maxLines: 10,
            minLines: 10,
            textFieldController: descriptionController,
            textInputAction: TextInputAction.done,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => hasMultipleWords(value),
            ]),
          ),
        ],
      ),
    );
  }
}
