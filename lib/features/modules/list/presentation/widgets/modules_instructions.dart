import 'package:flutter/material.dart';

class ModulesInstructions extends StatelessWidget {
  const ModulesInstructions({
    Key? key,
    this.isFirstModule = false,
    this.isLastModule = false,
  }) : super(key: key);

  final bool isFirstModule;
  final bool isLastModule;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Text(
            isFirstModule 
              ? 'Conheça as etapas' 
              :  isLastModule
                  ? 'Concluindo seus estudos'
                  : 'Continuando seus estudos',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 26.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0B1C40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Text(
            isFirstModule
              ? 'Seu estudo será dividido em etapas, cada etapa tem seu progresso indicado por uma barra.'
              : 'Você pode retomar o seu estudo de onde parou ou revisar etapas já concluídas.',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF444444),
            ),
          ),
        ),
      ],
    );
  }
}
