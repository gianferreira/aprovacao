import 'package:professional_development/core/arch/dependencies/dependency_injector.dart';
import 'package:professional_development/core/navigation/routes/routes.dart';
import 'package:professional_development/core/theme/theme.dart';
import 'package:professional_development/features/user/signin/presentation/pages/user_signin_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      theme: AprovacaoTheme.theme,
      home: const UserSignInPage(),
      routes: Routes.builders,
    );
  }
}
