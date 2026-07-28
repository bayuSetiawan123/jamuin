import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'jamu_detail.dart';

List<Map<String, String>> semuaJamu = [
  {
    "nama": "Beras Kencur",
    "khasiat": "Meningkatkan stamina, mengatasi masuk angin, melancarkan pencernaan, dan meningkatkan nafsu makan.",
    "gambar": "assets/img/jamu beras kencur.jpeg",
    "bahan": "- Beras 50 gram\n- Kencur 30 gram\n- Jahe 10 gram\n- Gula merah secukupnya\n- Daun pandan secukupnya",
    "cara": "1. Cuci bersih beras dan rendam semalaman.\n2. Haluskan kencur, jahe, dan beras.\n3. Campur dengan air rebusan gula merah dan daun pandan.\n4. Rebus campuran hingga mendidih, kemudian saring dan dinginkan.",
    "tips": "Minum selagi hangat, maksimal 2 kali sehari. Cocok diminum saat badan mulai tidak enak atau cuaca dingin.",
    "efek": "Konsumsi berlebihan dapat menyebabkan gangguan pencernaan atau mual."
  },
  {
    "nama": "Kunyit Asam",
    "khasiat": "Melancarkan haid, mengatasi nyeri haid, menyegarkan tubuh, dan meningkatkan daya tahan tubuh.",
    "gambar": "assets/img/kunyit asam.jpeg",
    "bahan": "- Kunyit 50 gram\n- Asam jawa 30 gram\n- Gula merah 100 gram\n- Air 500 ml\n- Daun pandan 1 lembar",
    "cara": "1. Cuci bersih kunyit dan parut.\n2. Rebus air bersama kunyit, asam jawa, gula merah, dan daun pandan hingga mendidih.\n3. Saring dan sajikan hangat atau dingin sesuai selera.",
    "tips": "Hindari minum saat perut kosong untuk mencegah iritasi lambung. Konsumsi maksimal 2 kali sehari.",
    "efek": "Penggunaan berlebihan bisa memicu asam lambung naik atau gangguan pencernaan."
  },
  {
    "nama": "Temulawak",
    "khasiat": "Menyehatkan fungsi hati (liver), membantu pencernaan, dan meningkatkan nafsu makan.",
    "gambar": "assets/img/temulawak.jpeg",
    "bahan": "- Temulawak 50 gram\n- Air 600 ml\n- Madu 1 sendok makan",
    "cara": "1. Cuci bersih temulawak dan potong-potong.\n2. Rebus temulawak dalam air hingga mendidih dan air berkurang setengahnya.\n3. Dinginkan lalu tambahkan madu sebelum diminum.",
    "tips": "Minum saat pagi hari sebelum makan untuk hasil optimal. Bisa diminum rutin setiap hari.",
    "efek": "Konsumsi dalam dosis tinggi dapat menyebabkan mual atau reaksi alergi ringan."
  },
  {
    "nama": "Wedang Uwuh",
    "khasiat": "Meningkatkan daya tahan tubuh, menghangatkan badan, dan membantu meredakan flu ringan.",
    "gambar": "assets/img/wedang uwuh.jpeg",
    "bahan": "- Kayu secang 30 gram\n- Cengkeh 10 gram\n- Jahe 20 gram\n- Serai 10 gram\n- Gula batu secukupnya\n- Daun pala 2 lembar",
    "cara": "1. Cuci bersih semua bahan.\n2. Rebus dengan air selama 15-20 menit hingga harum dan mendidih.\n3. Sajikan hangat dengan gula batu sesuai selera.",
    "tips": "Minum saat cuaca dingin atau saat merasa badan kurang fit. Bisa tambahkan madu sebagai pemanis alami.",
    "efek": "Tidak dianjurkan untuk penderita tekanan darah rendah atau orang yang sensitif terhadap rempah kuat."
  },
];

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<Map<String, String>> hasilFilter = List.from(semuaJamu);
  TextEditingController cariController = TextEditingController();

  void filterJamu(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        hasilFilter = List.from(semuaJamu);
      } else {
        hasilFilter = semuaJamu.where((jamu) {
          final nama = jamu["nama"]!.toLowerCase();
          final khasiat = jamu["khasiat"]!.toLowerCase();
          return nama.contains(keyword.toLowerCase()) ||
              khasiat.contains(keyword.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/img/welcome-logo.png', height: 40),
                    const SizedBox(width: 10),
                    Text(
                      'JAMUin',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2E7D32),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: cariController,
                  onChanged: filterJamu,
                  decoration: InputDecoration(
                    hintText: "Cari jamu atau khasiat...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: hasilFilter.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final jamu = hasilFilter[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => JamuDetailPage(jamu: jamu),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(2, 4),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.asset(
                                jamu["gambar"]!,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    jamu["nama"]!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF2E7D32),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    jamu["khasiat"]!,
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
