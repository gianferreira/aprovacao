import 'package:flutter/material.dart';

class AprovacaoLoadingView extends StatelessWidget {
  const AprovacaoLoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Color(0xFF0B1C40),
          ),
        ),
      ),
    );
  }
}

class AprovacaoNoLoadingView extends StatelessWidget {
  const AprovacaoNoLoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}
