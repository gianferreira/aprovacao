class CertificationEntity {
  final String id;
  final String title;
  final String subtitle;
  final int modulesAmount;
  final bool available; 
  final int expiresIn;
  final String userId;  

  const CertificationEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.modulesAmount,
    required this.available,
    required this.expiresIn,
    required this.userId,
  });
}

typedef CertificationsSnapshots =  ({
  List<Map<String, dynamic>> userCertifications, 
  List<Map<String, dynamic>> certifications,
}); 
