import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/routes.dart';
import 'package:news_app/injection_container.dart' as di;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() {
    if (di.sl<FirebaseAuth>().currentUser != null) {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  _start() {
    _timer = Timer(const Duration(seconds: 2), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Icon(Icons.newspaper, size: 100, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
