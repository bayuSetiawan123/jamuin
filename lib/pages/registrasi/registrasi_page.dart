import 'package:flutter/material.dart';
import 'package:jamuin/pages/login/login_page.dart';
import 'submit_registrasi.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/img/background 2.png',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Tombol kembali
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          // Konten utama
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Judul
                  const Text(
                    "Daftar Akun Baru",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 2),
                          blurRadius: 4.0,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Kotak form
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: namaController,
                          decoration: InputDecoration(
                            labelText: "Nama Lengkap",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.person_outline),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24),
                        SubmitRegistrasi(
                          namaController: namaController,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text(
                            "Sudah punya akun? Login di sini",
                            style: TextStyle(
                              color: Color(0xFF388E3C),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
