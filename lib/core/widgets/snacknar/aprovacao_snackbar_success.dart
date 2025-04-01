import 'package:flutter/material.dart';

class AprovacaoSnackBarSuccess {
  static show({
    required BuildContext context,
    String title = '',
    String message = '',
    Duration duration = const Duration(milliseconds: 4000),
  }) {
    showSuccessSnackBar(
      context: context,
      title: title,
      message: message,
      duration: duration,
    );
  }

  static Future<void> showSuccessSnackBar({
    required BuildContext context,
    required String title,
    required String message,
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
            color: const Color(0xFFC6E6CD),
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
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF317F50),
                          size: 20.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              height: 1.2,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF317F50),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: message.isNotEmpty,
                      child: const SizedBox(height: 8.0),
                    ),
                    if(message.isNotEmpty) 
                      Text(
                        message,
                        style: const TextStyle(
                          height: 1.2,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF317F50),
                        ),
                      ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
