import 'package:aprovacao/core/arch/dependencies/dependency_injector.dart';
import 'package:aprovacao/features/user/signin/presentation/pages/user_signin_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseConfig.currentPlatform,
  );

  runApp(const AprovacaoApp());
}

class AprovacaoApp extends StatelessWidget {
  const AprovacaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    DependencyInjector.initDependencies();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserSignInPage(),
    );
  }
}
