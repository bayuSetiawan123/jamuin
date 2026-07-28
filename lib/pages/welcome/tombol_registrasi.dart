import 'package:flutter/material.dart';
import '../registrasi/registrasi_page.dart';

class TombolRegistrasi extends StatelessWidget {
  const TombolRegistrasi({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RegisterPage()),
          );
          // Tidak perlu notifikasi di sini karena sudah ada di SubmitRegistrasi
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF388E3C), // Warna hijau herbal segar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: const Text(
          "Registrasi",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // kontras dengan hijau
          ),
        ),
      ),
    );
  }
}
