import 'package:flutter/material.dart';

class AprovacaoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AprovacaoAppBar({
    Key? key,
    this.title = '',
    this.hasBackButton = true,
    required this.onBackButtonPressed,
    this.customLeading = const SizedBox.shrink(),
    this.customAction = const SizedBox.shrink(),
  }) : super(key: key);

  final String title;  
  final bool hasBackButton;
  final VoidCallback onBackButtonPressed;
  final double appBarHeight = 60.0;
  final Widget customLeading; 
  final Widget customAction;

  @override
  Size get preferredSize => Size(
    double.infinity,
    appBarHeight,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xFFFFFFFF),
      foregroundColor: Color(0xFF101010),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'MyriadProRegular',
          height: 1.2,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Color(0xFF101010),
        ),
      ),
      leading: hasBackButton
        ? IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 28.0,
              color: Color(0xFF101010),
            ),
            onPressed: onBackButtonPressed,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          )
        : customLeading,
      actions: <Widget>[
        customAction,
      ],
    );
  }
}
