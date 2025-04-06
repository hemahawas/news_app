import 'package:flutter/material.dart';
import 'package:news_app/core/config/routes.dart';

class NvigatingToRegisterView extends StatelessWidget {
  const NvigatingToRegisterView({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don’t have an account?'),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.registerRoute);
              onPressed();
            },
            child: Text('Register here'),
          ),
        ],
      ),
    );
  }
}
