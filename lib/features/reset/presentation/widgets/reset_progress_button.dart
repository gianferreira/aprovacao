import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_tonal_button.dart';
import 'package:flutter/material.dart';

class ResetProgressButton extends StatefulWidget {
  const ResetProgressButton({
    super.key,
  });

  @override
  State<ResetProgressButton> createState() => _ResetProgressButtonState();
}

class _ResetProgressButtonState extends State<ResetProgressButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AprovacaoTonalButton(
      text: 'Resetar Progresso',
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
                          'Deseja realmente resetar todo o progresso?',
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
                        '''Essa ação não pode ser desfeita, todas as suas respostas e '''
                        '''prazos de revisão serão reiniciados.''',
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
                        text: 'Sim, resetar',
                        onPressed: () {
                          AprovacaoNavigator.pop(context: context);
                        },
                        padding: EdgeInsets.zero,
                      ),
                      AprovacaoFilledButton(
                        text: 'Voltar',
                        onPressed: () {
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
