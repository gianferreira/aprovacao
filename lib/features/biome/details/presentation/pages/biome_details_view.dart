import 'package:professional_development/core/navigation/arguments/user_args.dart';
import 'package:professional_development/core/navigation/navigators/navigator.dart';
import 'package:professional_development/core/navigation/routes/routes.dart';
import 'package:professional_development/features/contributions/list/presentation/widgets/contributions_handler.dart';
import 'package:professional_development/features/biome/list/domain/entities/biome_entity.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class BiomeDetailsView extends StatefulWidget {
  const BiomeDetailsView({
    super.key,
    required this.biome,
    required this.user,
  });

  final BiomeEntity biome;
  final UserEntity user;

  @override
  State<BiomeDetailsView> createState() => _BiomeDetailsViewState();
}

class _BiomeDetailsViewState extends State<BiomeDetailsView> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () =>  DevProNavigator.push(
            context: context,
            routeName: Routes.biomesList,
            args: UserArgs(user: widget.user),
          ),
        ),
        title: Text(
          widget.biome.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Image.network(
              widget.biome.urlImage,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                      ),
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: List.generate(
                          widget.biome.longExplanation.length, 
                          (index) => Padding(
                            padding: const EdgeInsets.only(
                              top: 24.0,
                              left: 16.0
                            ),
                            child: Text(
                              widget.biome.longExplanation[index],
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 16.0,
              ),
              child: LoadContributionsHandler(
                biome: widget.biome,
                user: widget.user,
                scrollController: scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
