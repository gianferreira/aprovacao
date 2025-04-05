import 'package:flutter/material.dart';

class CertificationButton extends StatelessWidget {
  const CertificationButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xFF0075FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6.0),
            bottomRight: Radius.circular(6.0),
          )
        ),
      ),
      onPressed:  isLoading 
        ? () {}
        : onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: CircularProgressIndicator(
                    color: Color(0xFFFFFFFF),
                  ),
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color(0xFFFFFFFF),
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
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        
    );
  }
}
