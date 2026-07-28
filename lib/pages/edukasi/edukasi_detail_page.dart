import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EdukasiDetailPage extends StatelessWidget {
  final Map<String, dynamic> topikDetail;

  const EdukasiDetailPage({super.key, required this.topikDetail});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2E7D32);
    final Color backgroundColor = const Color(0xFFF1F8E9);
    final TextStyle headingStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: primaryColor,
    );
    final TextStyle bodyStyle = GoogleFonts.poppins(fontSize: 16, height: 1.6);
    final TextStyle highlightStyle = GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.orange.shade800,
      fontWeight: FontWeight.w600,
    );

    // Untuk konten yang panjang, kita bisa bagi per paragraf dan tampilkan dengan widget berbeda agar lebih rapi
    List<String> paragraphs = topikDetail['konten'].split('\n\n');

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          topikDetail['judul'],
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (topikDetail['gambar'] != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      topikDetail['gambar'],
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                Text(
                  topikDetail['judul'],
                  style: headingStyle,
                ),
                const SizedBox(height: 20),
                ...paragraphs.map((para) {
                  // Kalau paragraf mengandung tanda "-", tampilkan dengan bullet list style
                  if (para.trim().startsWith('-')) {
                    List<String> items = para.trim().split('\n');
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: items.map((item) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("• ", style: TextStyle(fontSize: 18)),
                                Expanded(
                                  child: Text(
                                    item.replaceFirst('-', '').trim(),
                                    style: bodyStyle,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }

                  // Kalau paragraf ada kata kunci penting, kita highlight, contohnya "Mitos", "Fakta", "Tips"
                  if (para.contains('Mitos:') || para.contains('Fakta:') || para.contains('Tips')) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: RichText(
                        text: TextSpan(
                          children: para.split('\n').map<TextSpan>((line) {
                            if (line.contains('Mitos:') || line.contains('Fakta:') || line.contains('Tips')) {
                              return TextSpan(
                                  text: line + '\n',
                                  style: highlightStyle.copyWith(fontWeight: FontWeight.bold));
                            }
                            return TextSpan(text: line + '\n', style: bodyStyle);
                          }).toList(),
                        ),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(para.trim(), style: bodyStyle),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
