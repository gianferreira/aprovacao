import 'package:flutter/material.dart';

class AprovacaoFilledButton extends StatelessWidget {
  const AprovacaoFilledButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisable = false,
    this.padding = const EdgeInsets.all(16.0),
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisable;
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
            backgroundColor: Color(0xFF0B1C40),
            foregroundColor: Color(0xFFFFFFFF),
            textStyle: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: isDisable
                ? Color(0xFFB3B3B3)
                : Color(0xFFFFFFFF),
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
                    Color(0xFFFFFFFF),
                  ),
                  strokeWidth: 2.0,
                ),
              )
            : Text(text),
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
