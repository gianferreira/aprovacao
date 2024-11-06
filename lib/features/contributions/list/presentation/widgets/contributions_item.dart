import 'package:professional_development/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:flutter/material.dart';

class ContributionItem extends StatelessWidget {
  const ContributionItem({
    super.key,
    required this.contribution,
  });

  final ContributionEntity contribution;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.background,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            contribution.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            contribution.description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            contribution.userName,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
