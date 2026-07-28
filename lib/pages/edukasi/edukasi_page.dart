import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamuin/pages/makjamuin_page.dart';

class EdukasiPage extends StatelessWidget {
  const EdukasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2E7D32); // Hijau daun
    final Color backgroundColor = const Color(0xFFF0FFF4); // Hijau muda lembut

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
      automaticallyImplyLeading: false, // Menonaktifkan panah back
      backgroundColor: primaryColor,
      elevation: 2,
      title: Text(
        'Mak JAMUin',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MakJamuinChatPage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/img/mak jamuin.png'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Tanya Mak JAMUin',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Punya pertanyaan soal jamu? Yuk ngobrol langsung dengan Mak JAMUin dan temukan jawabannya!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MakJamuinChatPage(),
                          ),
                        );
                      },
                      icon: Icon(Icons.chat, size: 20, color: Colors.white),
                      label: Text(
                        'Mulai Chat',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
