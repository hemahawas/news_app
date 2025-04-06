import 'package:flutter/material.dart';
import 'package:news_app/core/shared_widgets/default_formfield.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;

  final VoidCallback changeVisibility;

  final bool isPasswordVisible;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.changeVisibility,
    required this.isPasswordVisible,
  });

  @override
  Widget build(BuildContext context) {
    return defaultFormField(
      controller: passwordController,
      type: TextInputType.visiblePassword,
      validate: (value) {
        if (value!.toString().isEmpty) {
          return 'Password is too short';
        }
      },
      label: 'Enter Your Password',
      prefix: Icons.lock,
      suffix: isPasswordVisible ? Icons.visibility : Icons.visibility_off,
      isPassword: !isPasswordVisible,
      suffixPressed: changeVisibility,
    );
  }
}
