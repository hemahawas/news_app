import 'package:flutter/material.dart';
import 'package:news_app/features/auth/presentation/view/widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: RegisterBody()));
  }
}
