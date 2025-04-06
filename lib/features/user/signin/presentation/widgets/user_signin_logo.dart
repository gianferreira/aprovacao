import 'package:flutter/material.dart';

class UserSignInLogo extends StatelessWidget {
  const UserSignInLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Image.asset(
              'assets/icon-aprovacao.png',
              width: 250.0,
              height: 250.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 140.0,
            ),
            child: Text(
              'A  P  R  O  V  A  Ç  Ã  O',
              style: TextStyle(
                fontFamily: 'MyriadProRegular',
                height: 1.2,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Color(0xFFF5F5F5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
