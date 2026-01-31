import 'package:flutter/material.dart';
import 'todo_page.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const TodoFormPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash_bg.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_logo.png',
                width: 160,
              ),
              const SizedBox(height: 24),
              const Text(
                'Sabah',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6B4E3D),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'STORY APP',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8B7A6B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
