import 'package:aprovacao/core/navigation/arguments/user_args.dart';
import 'package:aprovacao/features/biome/list/presentation/pages/biomes_list_view.dart';
import 'package:aprovacao/features/biome/list/presentation/stores/biome_controller.dart';
import 'package:aprovacao/features/biome/list/presentation/stores/biome_state.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/biome/list/biome_injection_container.dart' as biome_dependencies;

class BiomesListPage extends StatefulWidget {
  const BiomesListPage({super.key});

  @override
  State<BiomesListPage> createState() => _BiomesListPageState();
}

class _BiomesListPageState extends State<BiomesListPage> {
  late BiomeController biomeController;

  @override
  void initState() {
    biomeController = biome_dependencies.sl<BiomeController>();

    super.initState();
  }

  @override
  void dispose() {
    biomeController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    biomeController.loadBiomes();

    final userArgs = ModalRoute.of(context)?.settings.arguments as UserArgs;

    return ValueListenableBuilder<BiomeState>(
      valueListenable: biomeController, 
      builder: (context, state, child) {
        if(state is BiomeSuccess) {
          return BiomesListView(
            biomes: state.biomes,
            user: userArgs.user,
          );
        } else if(state is BiomeLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Deu ruim!'),
            ),
          );
        }
      },
    );
  }
}
