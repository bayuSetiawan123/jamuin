import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tombol_login.dart';
import 'tombol_registrasi.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.png'), // Ganti dengan background yang kamu pakai
            fit: BoxFit.cover,
            opacity: 0.3, // Agar teks tetap jelas
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  'assets/img/welcome-logo.png',
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Selamat Datang di JAMUin",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2E7D32),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                "Pelajari berbagai jenis jamu tradisional Indonesia hanya di ujung jari kamu!",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              const TombolRegistrasi(),
              const SizedBox(height: 20),
              const TombolLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
