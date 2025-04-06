import 'package:flutter/material.dart';
import 'package:news_app/features/auth/presentation/view/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LoginBody()));
  }
}
