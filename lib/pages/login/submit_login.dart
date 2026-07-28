import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main_page.dart';

class SubmitLogin extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SubmitLogin({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          final savedEmail = prefs.getString('email');
          final savedPassword = prefs.getString('password');

          if (emailController.text.trim() == savedEmail &&
              passwordController.text == savedPassword) {
            // Login berhasil
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.white),
                    SizedBox(width: 8),
                    Expanded(child: Text("Login berhasil!")),
                  ],
                ),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );

            // Delay sedikit agar user lihat notifikasi
            await Future.delayed(const Duration(milliseconds: 1500));

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const MainPage()),
            );
          } else {
            // Login gagal
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: const [
                    Icon(Icons.error_outline, color: Colors.white),
                    SizedBox(width: 8),
                    Expanded(child: Text("Email atau password salah!")),
                  ],
                ),
                backgroundColor: Colors.redAccent,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF388E3C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
