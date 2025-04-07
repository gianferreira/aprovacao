import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_empty_view.dart';
import 'package:flutter/material.dart';

class AprovacaoScaffoldView extends StatelessWidget {
  const AprovacaoScaffoldView({
    Key? key,
    required this.appBar,
    required this.body,
    required this.button,
    this.noButton = false,
    this.twoButtons = false,
  }) : super(key: key);

  final AprovacaoAppBar appBar;
  final Widget body;
  final Widget button;
  final bool twoButtons;
  final bool noButton;

  final double bottomNavigationBarSize = 80.0;
  final double secondButton = 64.0;
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
        bottomNavigationBar: twoButtons
          ? Container(
              color: Color(0xFFFFFFFF),
              child: SafeArea(
                child: Container(
                  color: Color(0xFFFFFFFF),
                  height: bottomNavigationBarSize + secondButton,
                  child: button,
                ),
              ),
            )
          : noButton
              ? AprovacaoEmptyView()
              : Container(
                color: Color(0xFFFFFFFF),
                child: SafeArea(
                  child: Container(
                    color: Color(0xFFFFFFFF),
                    height: bottomNavigationBarSize + dividerSize,
                    child: Column(
                      children: <Widget>[
                        Divider(
                          height: dividerSize,
                          thickness: dividerSize,
                          color: Color(0xFFEDEDED),
                        ),
                        button,
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
