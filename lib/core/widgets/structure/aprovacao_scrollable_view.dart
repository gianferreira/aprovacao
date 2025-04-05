import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_empty_view.dart';
import 'package:flutter/material.dart';

class AprovacaoScrollableView extends StatefulWidget {
  const AprovacaoScrollableView({
    Key? key,
    required this.itens,
    required this.appBar,
    required this.button,
    this.noButton = false,
    this.twoButtons = false,
    this.scrollController,
  }) : super(key: key);

  final List<Widget> itens;
  final AprovacaoAppBar appBar;
  final Widget button;
  final bool twoButtons;
  final bool noButton;
  final ScrollController? scrollController;

  final double bottomNavigationBarSize = 80.0;
  final double secondButton = 64.0;
  final double dividerSize = 2.0;

  @override
  State<AprovacaoScrollableView> createState() => _AprovacaoScrollableViewState();
}

class _AprovacaoScrollableViewState extends State<AprovacaoScrollableView> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {},
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: widget.appBar,
        body: SingleChildScrollView(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ...widget.itens,
              ],
            ),
          ),
        ),
        bottomNavigationBar: widget.twoButtons
          ? Container(
              color: Color(0xFFFFFFFF),
              child: SafeArea(
                child: Container(
                  color: Color(0xFFFFFFFF),
                  height: widget.bottomNavigationBarSize + widget.secondButton,
                  child: widget.button,
                ),
              ),
            )
          : widget.noButton
              ? AprovacaoEmptyView()
              : Container(
                color: Color(0xFFFFFFFF),
                child: SafeArea(
                  child: Container(
                    color: Color(0xFFFFFFFF),
                    height: widget.bottomNavigationBarSize + widget.dividerSize,
                    child: Column(
                      children: <Widget>[
                        Divider(
                          height: widget.dividerSize,
                          thickness: widget.dividerSize,
                          color: Color(0xFFEDEDED),
                        ),
                        widget.button,
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
