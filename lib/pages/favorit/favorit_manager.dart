import 'package:shared_preferences/shared_preferences.dart';

class FavoritManager {
  static const String favoritKey = 'favoritList';

  // Ambil daftar favorit
  static Future<List<String>> getFavoritList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favoritKey) ?? [];
  }

  // Tambah atau hapus favorit
  static Future<void> toggleFavorit(String namaJamu) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritList = prefs.getStringList(favoritKey) ?? [];

    if (favoritList.contains(namaJamu)) {
      favoritList.remove(namaJamu);
    } else {
      favoritList.add(namaJamu);
    }

    await prefs.setStringList(favoritKey, favoritList);
  }

  // Cek apakah nama jamu ada di favorit
  static Future<bool> isFavorit(String namaJamu) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritList = prefs.getStringList(favoritKey) ?? [];
    return favoritList.contains(namaJamu);
  }
}
