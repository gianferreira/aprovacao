import 'package:flutter/material.dart';

class ModuleReportInstructions extends StatelessWidget {
  const ModuleReportInstructions({
    Key? key,
  }) : super(key: key);

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
            'Relatórios',
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
            '''O relatório de progresso é liberado assim que '''
            '''todas as questões da etapa são respondidas.''',
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
