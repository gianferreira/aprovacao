import 'package:aprovacao/features/biome/details/presentation/pages/biome_details_page.dart';
import 'package:aprovacao/features/biome/list/presentation/pages/biomes_list_page.dart';
import 'package:aprovacao/features/contributions/create/presentation/pages/create_contribution_page.dart';
import 'package:aprovacao/features/user/signup/presentation/pages/user_signup_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const signIn = '/';
  static const signUp = '/users-signup';
  static const biomesList = '/biomes-list';
  static const biomesDetails = '/biomes-details';
  static const createContribution = '/contributions-create';

  static Map<String, Widget Function(BuildContext)> builders = {
    Routes.signUp: (_) => const UserSignUpPage(),
    Routes.biomesList:  (_) => const BiomesListPage(),
    Routes.biomesDetails: (_) => const BiomeDetailsPage(),
    Routes.createContribution: (_) => const CreateContributionPage(),
  };
}
