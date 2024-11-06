import 'package:flutter/material.dart';

class BiomeTextFormField extends StatelessWidget {
  const BiomeTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.maxLines,
    required this.minLines,
    required this.textInputAction,
    required this.textFieldController,
    required this.validator,
  });

  final String label;
  final String hintText;
  final int maxLines;
  final int minLines;
  final TextInputAction textInputAction;
  final TextEditingController textFieldController;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        TextFormField(
          controller: textFieldController,
          textInputAction: textInputAction,
          validator: validator,
          maxLines: maxLines,
          minLines: minLines,
          cursorColor: Colors.black,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF101010),
          ),
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
