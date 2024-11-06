import 'package:flutter/material.dart';

class UserSignInLogo extends StatelessWidget {
  const UserSignInLogo(
    {super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 32.0,
        ),
        child: Image.asset(
          'assets/biome-logo.jpg',
          width: 150.0,
          height: 150.0,
        ),
      ),
    );
  }
}
