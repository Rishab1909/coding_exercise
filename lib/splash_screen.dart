import 'package:coding_exercise/process_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashIt extends StatefulWidget {
  const SplashIt({super.key});

  @override
  _SplashItState createState() => _SplashItState();
}

class _SplashItState extends State<SplashIt> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProcessScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
