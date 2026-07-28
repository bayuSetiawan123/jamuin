import 'package:flutter/material.dart';
import '../login/login_page.dart';

class TombolLogin extends StatelessWidget {
  const TombolLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // putih bersih
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFF388E3C), width: 2), // hijau herbal
          ),
          elevation: 2,
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF388E3C), // hijau juga
          ),
        ),
      ),
    );
  }
}
