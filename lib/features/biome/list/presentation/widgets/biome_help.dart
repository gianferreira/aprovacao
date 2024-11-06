import 'package:flutter/material.dart';

class BiomesHelpIcon extends StatelessWidget {
  const BiomesHelpIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
      ),
      child: GestureDetector(
        child: const Icon(
          Icons.contact_support_outlined,
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            useSafeArea: true,
            enableDrag: true,
            showDragHandle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32.0),
              ),
            ),
            builder: (context) => const BiomesExplanation(),
          );
        },
      ),
    );
  }
}

class BiomesExplanation extends StatelessWidget {
  const BiomesExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.0),
        ),
      ),
      padding: const EdgeInsets.only(
        bottom: 32.0,
        left: 32.0,
        right: 32.0,
      ),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'O que são os biomas?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                '''Bioma é um conjunto de vida vegetal e animal, constituído pelo agrupamento de tipos de vegetação que '''
                '''são próximos e que podem ser identificados em nível regional, com condições de geologia e clima semel'''
                '''hantes e que, historicamente, sofreram os mesmos processos de formação da paisagem, resultando em uma'''
                ''' diversidade de flora e fauna própria.''',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                '''Em nosso país podemos encontrar seis tipos de biomas: Amazônia, Mata Atlântica, Cerrado, Caatinga, Pa'''
                '''mpa e Pantanal. Nossos Biomas são importantes não somente como recursos naturais em nosso país, mas, '''
                '''tem destaque como ambientes de grande riqueza natural no planeta.''',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                '''A Floresta Amazônica é considerada a maior diversidade de reserva biológica do planeta, com indicaçõe'''
                '''s de que abriga, ao menos, metade de todas as espécies vivas do planeta. Já o Cerrado é considerado a'''
                ''' savana com maior biodiversidade do mundo. Já a Mata Atlântica conta com recursos hídricos que abaste'''
                '''cem 70% da população nacional.''',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
