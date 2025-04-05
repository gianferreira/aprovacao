import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:flutter/material.dart';

class AprovacaoScaffoldView extends StatelessWidget {
  const AprovacaoScaffoldView({
    Key? key,
    required this.appBar,
    required this.body,
    this.bottom,
  }) : super(key: key);

  final AprovacaoAppBar appBar;
  final Widget body;
  final Widget? bottom;

  final double bottomNavigationBarSize = 80.0;
  final double dividerSize = 2.0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {}, 
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottom != null 
          ? SafeArea(
              child: Container(
                height: bottomNavigationBarSize + dividerSize,
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 2.0,
                      thickness: 2.0,
                      color: Color(0xFFEDEDED),
                    ),
                    bottom ?? Container(),
                  ],
                ),
              ),
            )
          : null,
      ),
    );
  }
}
