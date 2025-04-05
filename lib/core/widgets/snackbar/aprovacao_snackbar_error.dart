import 'package:aprovacao/core/widgets/snackbar/snackbar_progress_indicator.dart';
import 'package:flutter/material.dart';

class AprovacaoSnackBarError {
  static show({
    required BuildContext context,
    String title = '',
    String message = '',
    bool scrollable = true,
    Duration duration = const Duration(milliseconds: 4000),
  }) {
    _showErrorSnackBar(
      context: context,
      title: title,
      message: message,
      scrollable: scrollable,
      duration: duration,
    );
  }

  static Future<void> _showErrorSnackBar({
    required BuildContext context,
    required String title,
    required String message,
    required bool scrollable,
    required Duration duration,
  }) async {
    await Future.delayed(Duration.zero);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.down,
        elevation: 0.0,
        padding: EdgeInsets.zero,
        content: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE6C6C6),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.error,
                          color: Color(0xFF7F3131),
                          size: 20.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'MyriadProRegular',
                              height: 1.2,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7F3131),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: message.isNotEmpty,
                      child: SizedBox(height: 8.0),
                    ),
                    Visibility(
                      visible: message.isNotEmpty,
                      child: Text(
                        message,
                        style: TextStyle(
                          fontFamily: 'MyriadProRegular',
                          height: 1.2,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7F3131),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
              SnackBarProgressIndicator(
                valueColor: Color(0xFF7F3131),
                backGroundColor: Color(0xFFE6C6C6),
                duration: duration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
