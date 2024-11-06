import 'package:flutter/material.dart';

class ContributionsError extends StatelessWidget {
  const ContributionsError({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFFF0F0F0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 48.0,
      ),
      height: 250,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outlined,
            color: Theme.of(context).colorScheme.error,
            size: 48.0,
          ), 
          const SizedBox(height: 24.0),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
