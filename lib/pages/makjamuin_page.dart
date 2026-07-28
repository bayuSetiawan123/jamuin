import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MakJamuinChatPage extends StatefulWidget {
  const MakJamuinChatPage({super.key});

  @override
  State<MakJamuinChatPage> createState() => _MakJamuinChatPageState();
}

class _MakJamuinChatPageState extends State<MakJamuinChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _chatMessages = [
    {"sender": "Mak JAMUin", "message": "Halo nak, mau tanya apa soal jamu hari ini? 😊"},
  ];

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      _chatMessages.add({"sender": "Kamu", "message": message});
      _chatMessages.add({"sender": "Mak JAMUin", "message": "Hehe, Mak belum bisa jawab beneran ya. Nanti kalau udah pintar, Mak bantu jawab semua soal jamu!"});
      _controller.clear();
    });
  }

  Widget _buildChatBubble(String sender, String message) {
    bool isMak = sender == "Mak JAMUin";

    return Align(
      alignment: isMak ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isMak ? const Color(0xFFE0F2F1) : const Color(0xFF2E7D32),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isMak ? const Radius.circular(0) : const Radius.circular(16),
            bottomRight: isMak ? const Radius.circular(16) : const Radius.circular(0),
          ),
        ),
        child: Text(
          message,
          style: GoogleFonts.poppins(
            color: isMak ? Colors.black87 : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/img/mak jamuin.png'), // ganti dengan avatar Mak JAMUin
              radius: 18,
            ),
            const SizedBox(width: 10),
            Text(
              "Mak JamuIn",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                final chat = _chatMessages[index];
                return _buildChatBubble(chat['sender']!, chat['message']!);
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFFF9FFF5),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Tulis pertanyaanmu di sini...",
                      hintStyle: GoogleFonts.poppins(fontSize: 14),
                      border: InputBorder.none,
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF2E7D32)),
                  onPressed: () => _sendMessage(_controller.text),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
