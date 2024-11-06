import 'package:flutter/material.dart';

class ContributionsEmpty extends StatelessWidget {
  const ContributionsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xFFF0F0F0),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 48.0,
          ),
          height: 250,
          width: double.infinity,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outlined,
                color: Colors.grey,
                size: 48.0,
              ), 
              SizedBox(height: 24.0),
              Text(
                'Nenhuma contribuição adicionada ainda, seja o primeiro a contribuir!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
