import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JamuDetailPage extends StatelessWidget {
  final Map<String, String> jamu;

  const JamuDetailPage({super.key, required this.jamu});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2E7D32); // Warna hijau utama
    final Color backgroundColor = const Color(0xFFF1F8E9); // Latar hijau muda

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          jamu["nama"] ?? "",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: Colors.white,
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Jamu
                if (jamu["gambar"] != null && jamu["gambar"]!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      jamu["gambar"]!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 20),

                // Judul / Nama Jamu
                Text(
                  jamu["nama"] ?? "",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 20),

                // Khasiat
                if (jamu["khasiat"] != null)
                  section("Khasiat", jamu["khasiat"], Icons.favorite, primaryColor),

                // Bahan-bahan
                if (jamu["bahan"] != null)
                  section("Bahan-bahan", jamu["bahan"], Icons.list, primaryColor),

                // Cara Membuat
                if (jamu["cara"] != null)
                  section("Cara Membuat", jamu["cara"], Icons.kitchen, primaryColor),

                // Tips Penggunaan
                if (jamu["tips"] != null)
                  section("Tips Penggunaan", jamu["tips"], Icons.lightbulb, primaryColor),

                // Efek Samping
                if (jamu["efek"] != null)
                  section("Efek Samping", jamu["efek"], Icons.warning, Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk setiap bagian detail
  Widget section(String title, String? content, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content ?? "-",
            style: GoogleFonts.poppins(
              fontSize: 16,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
