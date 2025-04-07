import 'package:flutter/material.dart';

class ReportDashboardRevisionInfo extends StatelessWidget {
  const ReportDashboardRevisionInfo({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0.0,
        bottom: 8.0,
        left: 16.0,
        right: 8.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF444444),
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0075FF),
            ),
          ),
        ],
      ),
    );
  }
}