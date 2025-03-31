import 'package:aprovacao/core/navigation/arguments/biome_args.dart';
import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:aprovacao/features/contributions/list/presentation/widgets/button_add_contributions.dart';
import 'package:aprovacao/features/contributions/list/presentation/widgets/contributions_empty.dart';
import 'package:aprovacao/features/contributions/list/presentation/widgets/contributions_item.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ContributionsList extends StatelessWidget {
  const ContributionsList({
    super.key,
    required this.contributions,
    required this.biome,
    required this.user,
  });

  final List<ContributionEntity> contributions;
  final BiomeEntity biome;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        contributions.isEmpty
          ? const ContributionsEmpty()
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFF0F0F0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Contribuições',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ListView.separated(
                    itemCount: contributions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0.0),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 32.0);
                    },
                    itemBuilder: (context, index) {
                      return ContributionItem(contribution: contributions[index]);
                    },
                  ),
                ],
              ),
            ),
        const SizedBox(height: 16.0),
        AddContributionsButton(
          onPressed: () {
            DevProNavigator.push(
              context: context,
              routeName: Routes.createContribution,
              args: BiomeArgs(
                biome: biome,
                user: user
              ),
            );
          },
        ),
      ],
    );
  }
}
