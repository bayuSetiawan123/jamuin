import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favorit_manager.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({Key? key}) : super(key: key);

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  List<String> daftarFavorit = [];

  @override
  void initState() {
    super.initState();
    _loadFavorit();
  }

  Future<void> _loadFavorit() async {
    final favorit = await FavoritManager.getFavoritList();
    setState(() {
      daftarFavorit = favorit;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2E7D32);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Daftar Jamu Favorit",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: daftarFavorit.isEmpty
          ? Center(
              child: Text(
                "Belum ada jamu favorit.",
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: daftarFavorit.length,
              itemBuilder: (context, index) {
                final namaJamu = daftarFavorit[index];
                return ListTile(
                  leading: const Icon(Icons.local_drink, color: Colors.orange),
                  title: Text(namaJamu, style: GoogleFonts.poppins()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await FavoritManager.toggleFavorit(namaJamu);
                      _loadFavorit();
                    },
                  ),
                );
              },
            ),
    );
  }
}
