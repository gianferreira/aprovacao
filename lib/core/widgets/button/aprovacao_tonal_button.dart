import 'package:flutter/material.dart';

class AprovacaoTonalButton extends StatelessWidget {
  const AprovacaoTonalButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisable = false,
    this.padding = const EdgeInsets.fromLTRB(
      16.0, 16.0, 16.0, 0.0,
    ),
    this.icon,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisable;
  final Icon? icon;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 48.0, 
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            disabledBackgroundColor: Color(0xFFF0F0F0),
            disabledForegroundColor: Color(0xFFB3B3B3),
            backgroundColor: Color(0xFFE3E3E3),
            foregroundColor: Color(0xFF444444),
            textStyle: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: isDisable
                ? Color(0xFFB3B3B3)
                : Color(0xFF444444),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0,
          ),
          child: isLoading
            ? Container(
                width: 14.0,
                height: 14.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF444444),
                  ),
                  strokeWidth: 2.0,
                ),
              )
            : icon == null
              ? Text(text)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icon!,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'MyriadProRegular',
                          height: 1.2,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: isDisable
                            ? Color(0xFFB3B3B3)
                            : Color(0xFF444444),
                        ),
                      ),
                    ),
                  ],
                ),
          onPressed: isDisable 
            ? null
            : isLoading
              ? () {}
              : onPressed,
        ),
      ),
    );
  }
}
