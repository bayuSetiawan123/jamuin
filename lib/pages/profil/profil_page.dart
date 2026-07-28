import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamuin/pages/profil/editprofil_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jamuin/pages/welcome/welcome_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String nama = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadProfil();
  }

  Future<void> _loadProfil() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('nama') ?? '-';
      email = prefs.getString('email') ?? '-';
    });
  }

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WelcomePage()),
    );
  }

  Future<void> _updateProfil(String newNama, String newEmail) async {
    setState(() {
      nama = newNama;
      email = newEmail;
    });

    // Simpan ke SharedPreferences supaya persistent
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', newNama);
    await prefs.setString('email', newEmail);
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2E7D32);
    final Color backgroundColor = const Color(0xFFF0FFF4);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false, // hilangkan back arrow
        title: Text(
          "Profil Pengguna",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF2E7D32),
              child: Icon(Icons.person, color: Colors.white, size: 50),
            ),
            const SizedBox(height: 20),
            Text(
              nama,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              email,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 30),
            Divider(color: Colors.grey[400]),
            const SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.edit, color: primaryColor),
              title: Text(
                "Edit Profil",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: primaryColor),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilPage(namaAwal: nama, emailAwal: email),
                  ),
                );

                if (result != null) {
                  await _updateProfil(result['nama'], result['email']);
                }
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(
                "Keluar",
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.red),
              ),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
