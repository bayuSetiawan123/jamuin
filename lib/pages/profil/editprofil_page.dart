import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilPage extends StatefulWidget {
  final String namaAwal;
  final String emailAwal;

  const EditProfilPage({super.key, required this.namaAwal, required this.emailAwal});

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  late TextEditingController namaController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.namaAwal);
    emailController = TextEditingController(text: widget.emailAwal);
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2E7D32);
    final Color backgroundColor = const Color(0xFFF0FFF4);
    final Color labelColor = primaryColor.withOpacity(0.8);
    final Color inputTextColor = Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Edit Profil',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Nama Input
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: namaController,
                style: GoogleFonts.poppins(color: inputTextColor, fontSize: 16),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  labelText: 'Nama Lengkap',
                  labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: labelColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Email Input
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.poppins(color: inputTextColor, fontSize: 16),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  labelText: 'Email',
                  labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: labelColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  shadowColor: primaryColor.withOpacity(0.4),
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    'nama': namaController.text.trim(),
                    'email': emailController.text.trim(),
                  });
                },
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
