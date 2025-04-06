import 'package:flutter/material.dart';
import 'package:news_app/core/shared_widgets/custom_snack_bar.dart';
import 'package:news_app/core/shared_widgets/default_text_button.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final VoidCallback onSuccess;

  const RegisterButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextButton(
      onPressed: () {
        if (!(emailController.text.contains('@'))) {
          CustomSnackBar.show(
            message: 'Email must contain @',
            context: context,
            color: Colors.grey,
          );
        }
        if (passwordController.text.length < 8) {
          CustomSnackBar.show(
            message: 'Password is too short',
            context: context,
            color: Colors.grey,
          );
        }
        if (emailController.text.contains('@') &&
            passwordController.text.length >= 8) {
          onSuccess();
        }
      },
      text: 'register',
    );
  }
}
