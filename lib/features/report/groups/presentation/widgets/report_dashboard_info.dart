import 'package:flutter/material.dart';

class ReportDashboardInfo extends StatelessWidget {
  const ReportDashboardInfo({
    super.key,
    required this.label,
    required this.value,
    required this.isModule,
  });

  final String label;
  final String value;
  final bool isModule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
        left: 16.0,
        right: 8.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            value,
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: isModule ? 20.0 : 18.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0B1C40),
            ),
          ),
          const SizedBox(width: 8.0),
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
        ],
      ),
    );
  }
}