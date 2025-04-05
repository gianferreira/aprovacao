import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class CertificationItem extends StatelessWidget {
  const CertificationItem({
    super.key,
    required this.certification,
    required this.user,
  });

  final CertificationEntity certification;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      borderRadius: BorderRadius.circular(24.0),
      splashColor: Colors.grey.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16.0),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
