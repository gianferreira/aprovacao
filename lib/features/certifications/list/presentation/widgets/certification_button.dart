import 'package:flutter/material.dart';

class CertificationButton extends StatelessWidget {
  const CertificationButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isDisable = false,
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 24.0,
      ),
      child: Container(
        height: 48.0,
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            disabledBackgroundColor: Color(0xFFF0F0F0),
            disabledForegroundColor: Color(0xFFB3B3B3),
            backgroundColor: Color(0xFF0075FF),
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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
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
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: isDisable
                      ? Color(0xFFB3B3B3)
                      : Color(0xFFFFFFFF),
                    size: 18.0,
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'MyriadProRegular',
                      height: 1.2,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: isDisable
                        ? Color(0xFFB3B3B3)
                        : Color(0xFFFFFFFF),
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
