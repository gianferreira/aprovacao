import 'package:flutter/material.dart';

class CreateContributionHeader extends StatelessWidget {
  const CreateContributionHeader({
    super.key,
    required this.biomeName,
  });

  final String biomeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.warning_amber_rounded,
          color: Theme.of(context).colorScheme.primary,
          size: 36.0,
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Contribuição para o bioma: ',
            ),
            Text(
              biomeName,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
