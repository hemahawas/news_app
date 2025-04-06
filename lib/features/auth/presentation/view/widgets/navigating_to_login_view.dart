import 'package:flutter/material.dart';
import 'package:news_app/core/config/routes.dart';

class NavigatingToLoginView extends StatelessWidget {
  const NavigatingToLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?'),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          },
          child: Text('Login here'),
        ),
      ],
    );
  }
}
