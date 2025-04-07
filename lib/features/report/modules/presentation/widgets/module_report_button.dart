import 'package:flutter/material.dart';

class ModuleReportButton extends StatelessWidget {
  const ModuleReportButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      width: 80.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF02CEFD),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          splashFactory: NoSplash.splashFactory,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0.0,
        ),
        child: Text(
          'Conferir',
          style: TextStyle(
            fontFamily: 'MyriadProRegular',
            height: 1.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF02CEFD),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
