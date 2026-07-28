import 'package:flutter/material.dart';
import 'package:jamuin/pages/edukasi/edukasi_page.dart';
import 'package:jamuin/pages/profil/profil_page.dart';
import 'beranda/beranda_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  final List<Widget> pages = [
    const BerandaPage(),
    const EdukasiPage(),
    const ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: Colors.brown,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Edukasi"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
