import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_tonal_button.dart';
import 'package:flutter/material.dart';

class AprovacaoExitBottomSheet extends StatelessWidget {
  const AprovacaoExitBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 28.0,
        color: Color(0xFF101010),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: true,
          useSafeArea: true,
          backgroundColor: Color(0xFFFFFFFF),
          enableDrag: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12.0),
            ),
          ),
          builder: (context) => SafeArea(
            child: Container(
              height: 300.0,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Deseja descartar as alterações?',
                          style: TextStyle(
                            fontFamily: 'MyriadProRegular',
                            height: 1.2,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF101010),
                          ),
                        ),
                      ),    
                      const SizedBox(height: 24.0),
                      Text(
                        '''Ao sair da revisão as respostas assinaladas até aqui serão perdidas, '''
                        '''para salvar as alterações prossiga o fluxo até concluir a revisão.''',
                        style: TextStyle(
                          fontFamily: 'MyriadProRegular',
                          height: 1.2,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF5F5F5F),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      AprovacaoTonalButton(
                        text: 'Cancelar e continuar revisão',
                        onPressed: () {
                          AprovacaoNavigator.pop(context: context);
                        },
                        padding: EdgeInsets.zero,
                      ),
                      AprovacaoFilledButton(
                        text: 'Sair sem salvar',
                        onPressed: () {
                          AprovacaoNavigator.pop(context: context);
                          AprovacaoNavigator.pop(context: context);
                        },
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
