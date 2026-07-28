import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubmitRegistrasi extends StatelessWidget {
  final TextEditingController namaController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SubmitRegistrasi({
    super.key,
    required this.namaController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () async {
          String nama = namaController.text.trim();
          String email = emailController.text.trim();
          String password = passwordController.text.trim();

          if (nama.isEmpty || email.isEmpty || password.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.shade600,
                content: Row(
                  children: const [
                    Icon(Icons.error_outline, color: Colors.white),
                    SizedBox(width: 12),
                    Expanded(child: Text('Semua kolom harus diisi!')),
                  ],
                ),
              ),
            );
            return;
          }

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('nama', nama);
          await prefs.setString('email', email);
          await prefs.setString('password', password);

          // Notifikasi berhasil
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green.shade700,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              content: Row(
                children: const [
                  Icon(Icons.check_circle_outline, color: Colors.white),
                  SizedBox(width: 12),
                  Expanded(child: Text('Akun berhasil dibuat! Silakan login.')),
                ],
              ),
              duration: Duration(seconds: 3),
            ),
          );

          await Future.delayed(Duration(seconds: 1));
          Navigator.pop(context, true); // kembali ke login
        },
        icon: const Icon(Icons.person_add_alt_1),
        label: const Text(
          "Daftar",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF388E3C),
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
