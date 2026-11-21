import 'package:flutter/material.dart';
import 'package:skill_improvement/presentation/log_in_page.dart';

class LoginPageBase extends StatelessWidget {
  const LoginPageBase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      home: const LogInPage(),
    );
  }
}