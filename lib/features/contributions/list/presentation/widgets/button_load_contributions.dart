import 'package:flutter/material.dart';

class LoadContributionsButton extends StatelessWidget {
  const LoadContributionsButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          if(!isLoading) {
            onPressed();
          }
        }, 
        child: isLoading
          ? SizedBox(
              height: 14.0,
              width: 14.0,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.background,
                strokeWidth: 2.0,
              ),
            )
          : const Text(
              'Carregar contribuições',
            ),
      ),
    );
  }
}
