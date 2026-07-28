import 'package:flutter/material.dart';
import 'package:jamuin/pages/welcome/welcome_page.dart';

class JamuinPage extends StatefulWidget {
  const JamuinPage({super.key});

  @override
  State<JamuinPage> createState() => _JamuinPageState();
}

class _JamuinPageState extends State<JamuinPage> {
  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  void _startSplash() async {
    await Future.delayed(const Duration(seconds: 10));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.png'), // Ganti dengan file background kamu
            fit: BoxFit.cover,
            opacity: 0.3, // Transparansi opsional biar konten tetap kelihatan
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/img/welcome-logo.png',
            height: 220,
          ),
        ),
      ),
    );
  }
}
