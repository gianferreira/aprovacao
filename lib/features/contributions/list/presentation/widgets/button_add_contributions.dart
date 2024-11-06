import 'package:flutter/material.dart';

class AddContributionsButton extends StatelessWidget {
  const AddContributionsButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          onPressed();
        }, 
        child: const Text(
          'Adicionar contribuição',
        ),
      ),
    );
  }
}
