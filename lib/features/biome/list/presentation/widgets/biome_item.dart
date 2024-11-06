import 'package:professional_development/core/navigation/arguments/biome_args.dart';
import 'package:professional_development/core/navigation/navigators/navigator.dart';
import 'package:professional_development/core/navigation/routes/routes.dart';
import 'package:professional_development/features/biome/list/domain/entities/biome_entity.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class BiomeItem extends StatelessWidget {
  const BiomeItem({
    super.key,
    required this.biome,
    required this.user,
  });

  final BiomeEntity biome;
  final UserEntity user;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DevProNavigator.push(
          context: context,
          routeName: Routes.biomesDetails,
          args: BiomeArgs(
            biome: biome,
            user: user
          ),
        );
      },
      borderRadius: BorderRadius.circular(24.0),
      splashColor: Colors.grey.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              biome.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    biome.urlImage,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width / 2.5,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    biome.shortExplanation,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Área total: ',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Text(
                  biome.currentArea,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
