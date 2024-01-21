import 'package:flutter/material.dart';
import 'package:shoppe/features/login/ui/widgets/text_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextLogin(),
          ],
        ),
      ),
    );
  }
}
